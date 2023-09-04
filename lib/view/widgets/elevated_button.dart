import 'package:flutter/material.dart';

Widget elevatedButton(
    {required String text,
    required Function() onpressed,
    required double width,
    required double height}) {
  TextStyle textStyle = const TextStyle(
      fontSize: 24,
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      color: Colors.white);
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: const Color(0xFF5cb1df),
      elevation: 7);
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
        style: buttonStyle,
        onPressed: onpressed,
        child: Text(text, style: textStyle)),
  );
}
