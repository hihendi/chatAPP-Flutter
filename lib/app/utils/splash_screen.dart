import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: Get.width * 0.8,
            width: Get.width * 0.8,
            child: Lottie.asset("assets/lottie/hello.json"),
          ),
        ),
      ),
    );
  }
}
