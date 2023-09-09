import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/main_controller.dart';
import 'package:store/core/constant/colors.dart';
import 'package:store/view/widgets/elevated_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
                onPressed: () async {
                  await controller.signout();
                },
              );
            })
          ],
        ),
        body: GetBuilder<Mainimp>(
          builder: (controller) {
            return Padding(
              padding: const  EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(
                    margin:const  EdgeInsets.only(top: 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    elevation: 10,
                    color: AppColors.primaryColor,
                    child: Container(

                      height: 60,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(left: 7 , bottom: 15),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            controller.getname(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const Icon(
                            Icons.flutter_dash_outlined,
                            size: 35,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  elevatedButton(
                      text: "Click bro",
                      radius: 25,
                      onpressed: () {
                        controller.clickbro();
                      })
                ],
              ),
            );
          },
        ));
  }
}
