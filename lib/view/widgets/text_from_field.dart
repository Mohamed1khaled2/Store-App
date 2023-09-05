import 'package:flutter/material.dart';
import 'package:get/get.dart';

String messageEmpty = "You must write your";

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
    bool? filled,
    Color? colorLabel,
    Color? colorFilled,
    double fontsize = 12,
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
        errorStyle: TextStyle(fontSize: fontsize),
        filled: filled,
        fillColor: colorFilled,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        hintText: hintname,
        hintStyle: textStyleHint,
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              label,
              style: TextStyle(color: colorLabel),
            )),
        suffixIcon: icon),
  );
}

TextFormField textFormfiledEmail({
  Color? colorFilled,
  bool? filled,
  Color? colorLabel,
  TextEditingController? controller,
}) {
  return textformfiled(
    label: "Email",
    filled: filled,
    colorLabel: colorLabel,
    colorFilled: colorFilled,
    keyboardtype: TextInputType.emailAddress,
    hintname: "Enter your email",
    icon: const Icon(Icons.email_rounded),
    validator: (value) {
      if (value!.isEmpty) {
        return "$messageEmpty Email";
      } else if (value.isEmail == false) {
        return "Example: example@info.com";
      } else {
        return null;
      }
    },
  );
}

TextFormField textFormFiledPassword({
  TextEditingController? controller,
  String hintname = "Enter your password",
  String label = 'Password',
  String typevalidator = "Passsword",
}) {
  return textformfiled(
    hintname: hintname,
    validator: (value) {
      if (value!.isEmpty) {
        return "$messageEmpty $typevalidator";
      } else if (value.length <= 8) {
        return "You must your Password greater than eight";
      } else {
        return null;
      }
    },
    controller: controller,
    label: label,
    icon: const Icon(Icons.password_rounded),
    obscuretext: true,
    chr: '*',
    enableSuggestions: false,
  );
}

TextFormField textFormFieldNormaill(
    {required String hintname,
    required String label,
    String? typevalidator,
    TextEditingController? controller}) {
  return textformfiled(
      controller: controller,
      fontsize: 13,
      hintname: hintname,
      textStyleHint: const TextStyle(fontSize: 13),
      validator: (value) {
        if (value!.isEmpty) {
          return "$typevalidator?!";
        } else if (!GetUtils.isUsername(value)) {
          return "Not valid $typevalidator";
        } else {
          return null;
        }
      },
      label: label);
}
