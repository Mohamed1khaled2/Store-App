import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/verfication_controller.dart';
import 'package:store/view/screen/auth/constans.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:store/view/widgets/text_button.dart';

class Verfication extends StatefulWidget {
  const Verfication({super.key});

  @override
  State<Verfication> createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {
  String currenttext = '';
  @override
  Widget build(BuildContext context) {
    Get.put(VerficationImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(text: 'Verfication'),
      body: GetBuilder<VerficationImp>(builder: (controller) {
        return ListView(
          padding: const EdgeInsets.all(15),
          children: [
            // Center Text
            Center(
              child: Text("Enter Your Code",
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            const SizedBox(height: 30),

            //OTP code
            Padding(
              padding: const EdgeInsets.all(10),
              child: PinCodeTextField(
                autoFocus: true,
                length: 6,
                obscureText: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  fieldOuterPadding: const EdgeInsets.all(8),
                  errorBorderColor: Colors.red,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(15),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                onCompleted: (v) {
                  Get.dialog(AlertDialog(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    title: Text(
                      "Reset Password",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "If u need create new password click yes",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textButton(
                                onpressed: () {
                                  controller.no(); // main Page
                                },
                                text: "No"),
                            textButton(
                                onpressed: () {
                                  controller.yes(); // Reset Password
                                },
                                text: 'Yes'),
                          ],
                        )
                      ],
                    ),
                  ));
                },
                appContext: context,
              ),
            ),
          ],
        );
      }),
    );
  }
}
