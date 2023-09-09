import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store/core/constant/routes_names.dart';
import 'package:store/core/services/services.dart';
import 'package:store/view/widgets/snack_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer' as dev show log;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  //email , password , name
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? username;
  MyServices myServices = Get.find();

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());

    dev.log("changed so i show you information ${_user.toString()}");
    ever(_user, printo);
  }

  printo(User? user) {
    // i will handle this
    // this fun work if user info changed only
  }

  Future sendVerificationEmail() async {
    // Semt Email verified
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      Get.showSnackbar(messageWrongSnackBar(messageText: e.toString()));
    }
  }

  void register(
      {required String email,
      required String password,
      required String fname,
      User? user}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.currentUser?.updateDisplayName(fname);
      username = fname;
      Get.offAllNamed(AppRouteName.verfication);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.showSnackbar(messageWrongSnackBar(
          messageText: "weak-password",
        ));
      } else if (e.code == 'email-already-in-use') {
        Get.showSnackbar(messageWrongSnackBar(
          messageText: "email-already-in-use",
        ));
      }
    } catch (e) {
      Get.showSnackbar(messageWrongSnackBar(
        messageText: "from ${e.toString()}",
      ));
    }
  }

  void login({
    required String email,
    required String password,
    User? user,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser!;
      if (!user.emailVerified) {
        Get.offAllNamed(AppRouteName.verfication);
      } else {
        Get.offAllNamed(AppRouteName.main);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.showSnackbar(
            messageWrongSnackBar(messageText: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        Get.showSnackbar(messageWrongSnackBar(
            messageText: 'Wrong password provided for that user.'));
      } else if (e.code == 'network-request-failed') {
        Get.showSnackbar(
            messageWrongSnackBar(messageText: 'network-request-failed'));
      } else {}
    }
  }

  void logout() async {
    // Log out from email
    try {
      await auth.signOut();
      await Future.delayed(Duration(seconds: 1), () {
        Get.offAllNamed(AppRouteName.login);
      });
    } on FirebaseAuthException catch (e) {
      dev.log(e.code);
    }
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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  infoUser() {
    if (auth.currentUser != null) {
      // I have info from database

      // auth.currentUser!.reload();
      User? info = auth.currentUser;
      username = info?.displayName;
    } else {
      dev.log("i don't have any info from database");
    }
  }

  forgetPassword({required String email}) async {
   try {
     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

   }on FirebaseAuthException catch(e){
     print(e.code);
   }
  }
}
