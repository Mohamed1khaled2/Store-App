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
    bool obscurebool = false,
    Widget? icon,
    TextStyle? textStyleHint,
    TextEditingController? controller,
    Function()? ontapIconpassword,
    bool? filled,
    Color? colorLabel,
    Color? colorFilled,
    double fontsize = 12,
    String label = 'null'}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: obscurebool,
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
        suffixIcon: GestureDetector(
          onTap: ontapIconpassword,
          child: icon,
        )),
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
    controller: controller,
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
      } else {}
    },
  );
}



TextFormField textFormFiledPassword(
    {TextEditingController? controller,
    bool obscurebool = false,
    String hintname = "Enter your password",
    String label = 'Password',
    String typevalidator = "Passsword",
    Function()? ontapIconpassword}) {
  return textformfiled(
      hintname: hintname,
      validator: (value) {
        if (value!.isEmpty) {
          return "$messageEmpty $typevalidator";
        } else if (value.length <= 8) {
          return "You must your Password greater than eight";
        } else {}
      },
      controller: controller,
      label: label,
      icon: const Icon(Icons.password_rounded),
      obscurebool: obscurebool,
      chr: '*',
      enableSuggestions: false,
      ontapIconpassword: ontapIconpassword);
}

Container textfilednormail(
    {String? hintText,
    double width = 180,
    double height = 60,
    required labelText,
    String? typetext,
    required TextEditingController textEditingController}) {
  return Container(
    width: width,
    height: height,

    // color: Colors.black,
    child: Center(
      child: TextFormField(
        controller: textEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return "$typetext?!";
          }
        },
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.red)),
          errorStyle:
              width == 180 ? const TextStyle(fontSize: 13) : const TextStyle(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          hintText: hintText,
          label: Text(labelText),
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    ),
  );
}
