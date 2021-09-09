import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';
import '../../../controllers/auth_controller.dart';

class LoginView extends GetView<LoginController> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width * 0.7,
                height: Get.width * 0.7,
                child: Lottie.asset("assets/lottie/login.json"),
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () => authController.login(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        child: Image.asset("assets/logo/google.png"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Sign In with Google",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    primary: Colors.pink[400],
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
