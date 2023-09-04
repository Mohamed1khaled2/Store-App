import 'package:flutter/material.dart';

Widget elevatedButton(
    {required String text,
    Color? color,
   required double radius , 
    required Function() onpressed,
}) {
  TextStyle textStyle = const TextStyle(
      fontSize: 24,
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      color: Colors.white);
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      backgroundColor: color,
      elevation: 7);
  return ElevatedButton(
      style: buttonStyle,
      onPressed: onpressed,
      child: Text(text, style: textStyle));
}
