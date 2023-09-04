import 'package:flutter/material.dart';

TextButton textButton({
  required Function() onpressed,
  required String text,
}) {
  return TextButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
}
