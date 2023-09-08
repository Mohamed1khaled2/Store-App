import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/view/screen/main_screen.dart';
import 'package:store/view/widgets/snack_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class AuthController extends GetxController {
  static AuthController instance = Get.find();
  //email , password , name
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(AppRouteName.login);
    } else {
      Get.offAll(MainScreen(name: user.displayName));
    }
  }

  void register(String email, password, fname) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.currentUser?.updateDisplayName(fname);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.showSnackbar(getsnackbarwrong(
            messagetext: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        getsnackbarwrong(messagetext: "email-already-in-use");
      }
    } catch (e) {
      getsnackbarwrong(messagetext: "from ${e.toString()}");
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.showSnackbar(
            getsnackbarwrong(messagetext: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        Get.showSnackbar(getsnackbarwrong(
            messagetext: 'Wrong password provided for that user.'));
      } else {
        print(e.toString());
      }
    }
  }

  void logout() async {
    await auth.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    print(credential);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}
