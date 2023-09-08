import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/main_controller.dart';
import 'package:store/view/widgets/elevated_button.dart';

class MainScreen extends StatelessWidget {
  final String? name;
  const MainScreen({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    Get.put(Mainimp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Main Page"),
        centerTitle: true,
        actions: [
          GetBuilder<Mainimp>(builder: (controller) {
            return IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                controller.signout();
              },
            );
          })
        ],
      ),
      body: GetBuilder<Mainimp>(builder: (controller) {
        return Column(
          children: [
            const SizedBox(height: 180),
            Center(
                child: Text(
              name ?? "loading..",
              style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            )),
            elevatedButton(text: "s", radius: 25, onpressed: () {})
          ],
        );
      }),
    );
  }
}
