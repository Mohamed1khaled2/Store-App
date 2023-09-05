import 'package:flutter/material.dart';
import 'package:store/view/screen/auth/constans.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(text: "Main Page"),
    );
  }
}
