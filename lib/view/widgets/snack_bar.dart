import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetSnackBar getsnackbarwrong({
  required messagetext
}) {
  return GetSnackBar(
    titleText: const  Text(
      "Wrong",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    ),
    maxWidth: 250,
    borderRadius: 25,
    duration: const Duration(seconds: 2),
    message: messagetext,
    isDismissible: false,
    snackPosition: SnackPosition.TOP,
  );
}
