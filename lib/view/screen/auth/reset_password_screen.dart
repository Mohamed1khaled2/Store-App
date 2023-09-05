import 'package:flutter/material.dart';
import 'package:store/view/screen/auth/constans.dart';
import 'package:store/view/widgets/elevated_button.dart';
import 'package:store/view/widgets/text_from_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(text: 'Reset Password'),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Column(
              children: [
                const SizedBox(height: 15),
                textFormFiledPassword(
                    hintname: "Enter New Password", label: "New password"),
                const SizedBox(height: 25),
                textFormFiledPassword(
                    hintname: "Enter re-New Password",
                    label: "Re-new password"),
                const SizedBox(height: 25),
                SizedBox(
                  height: 45,
                  width: 150,
                  child: elevatedButton(
                      text: 'Done', radius: 25, onpressed: () {}),
                )
              ],
            )
          ],
        ));
  }
}
