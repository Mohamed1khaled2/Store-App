import 'package:flutter/material.dart';
import 'package:store/core/constant/message_texts.dart';

TextFormField textformfiled(
    {required String hintname,
    String? Function(String?)? validator,
    TextInputType? keyboardtype,
    String chr = '*',
    bool autocorrect = false,
    bool enableSuggestions = true,
    bool obscuretext = false,
    Widget? icon,
    TextStyle? textStyleHint,
    TextEditingController? controller,
    String label = 'null'}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: obscuretext,
    obscuringCharacter: chr,
    autocorrect: autocorrect,
    enableSuggestions: enableSuggestions,
    keyboardType: keyboardtype,
    decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        hintText: hintname,
        hintStyle: textStyleHint,
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(label)),
        suffixIcon: icon),
  );
}

vildator(String value, int min, String typeValidator) {
  if (value.isEmpty) {
    return "$AppMessages.messageEmpty$typeValidator";
  } else if (value.length < min) {
    return '$typeValidator Greater than $min';
  } else {
    return null;
  }
}

TextFormField textFormfiledEmail({
  TextEditingController? controller,
}) {
  return textformfiled(
    label: "Email",
    keyboardtype: TextInputType.emailAddress,
    hintname: "Enter your email",
    icon: const Icon(Icons.email_rounded),
    validator: (value) {
      return vildator(value!, 8, 'email');
    },
  );
}

TextFormField textFormFiledPassword({
  TextEditingController? controller,
  String hintname = "Enter your password",
  String label = 'Password',
}) {
  return textformfiled(
    hintname: hintname,
    validator: (value) {
      return vildator(value!, 8, 'password');
    },
    controller: controller,
    label: label,
    icon: const Icon(Icons.password_rounded),
    obscuretext: true,
    chr: '*',
    enableSuggestions: false,
  );
}
TextFormField textFormFieldNormaill({
  required String hintname , 
  required String label , 
  TextEditingController? controller 
}){
  return textformfiled(
    controller: controller,
    hintname: hintname, 
    textStyleHint: const TextStyle(fontSize: 13) , 
    label: label
  );
}