import 'package:flutter/material.dart';

Text bigText({
  required String text,
}) {
  TextStyle styletext =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold , fontFamily: "Cairo");
  return Text(
    text,
    style: styletext,
  );
}
