import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

Container socialmediaSignInAndSignup(
    {
      //required void Function()? onpressedTwiiter,
    // required void Function()? onpressedFacebook
      required void Function()? onpressedgoogle,

    }) {
  return Container(
    padding: const EdgeInsets.all(15),
    alignment: Alignment.center,
    width: 350,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SignInButton.mini(
          buttonType: ButtonType.google,
          onPressed: onpressedgoogle,
        ),
        // SignInButton.mini(
        //   buttonType: ButtonType.facebook,
        //   onPressed: onpressedFacebook,
        // ),
        // SignInButton.mini(
        //   buttonType: ButtonType.twitterX,
        //   onPressed: onpressedTwiiter,
        // ),
      ],
    ),
  );
}

AppBar appBar({required String text}) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    elevation: 0,
    title: Text(
      text,
      style: const TextStyle(
          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 24),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
  );
}
