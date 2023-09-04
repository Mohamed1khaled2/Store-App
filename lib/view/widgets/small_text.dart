import 'package:flutter/material.dart';

Text smallText({required String text , TextAlign? textAlign , Color? color}) {
  TextStyle textStyle =   TextStyle(
    color: color,
    height: 1.6 ,fontSize: 19 ,
  );
  return Text(text , style: textStyle,textAlign: textAlign,);
}
