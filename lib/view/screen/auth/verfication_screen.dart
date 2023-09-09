import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/verfication_controller.dart';
import 'package:store/view/widgets/elevated_button.dart';

class VerficationScreen extends StatelessWidget {
  const VerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerficationImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Verified",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: GetBuilder<VerficationImp>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 5,
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(10),
                  height: 95,
                  child: const Text(
                    "A verified has been sent to your email",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            elevatedButton(
                text: "Resent verified",
                radius: 25,
                onpressed: () {
                  controller.resentemail();
                }),
            const SizedBox(height: 15),
            elevatedButton(
                text: "Sign out",
                radius: 25,
                onpressed: () {
                  controller.signOut();
                }),
          ],
        );
      }),
    );
  }
}
