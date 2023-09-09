import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetSnackBar messageSnackBar({
  required messagetext,
  required messagetitle,
  Color? messagetitlecolor,
}) {
  return GetSnackBar(
    titleText: Text(
      messagetitle,
      style: TextStyle(
        color: messagetitlecolor,
        fontWeight: FontWeight.bold,
      ),
    ),
    maxWidth: 250,
    borderRadius: 25,
    duration: const Duration(seconds: 2),
    message: messagetext,
    isDismissible: false,
    snackPosition: SnackPosition.TOP,
  );
}

GetSnackBar messageWrongSnackBar({
  required String messageText,
}){
  return messageSnackBar(messagetext: messageText, messagetitle: "Wrong"  , messagetitlecolor: Colors.red );
}