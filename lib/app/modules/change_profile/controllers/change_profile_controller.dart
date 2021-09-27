import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:chatapp/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  final authController = Get.find<AuthController>();
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController statusController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentUsers = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    statusController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    statusController.dispose();
    super.onClose();
  }

  //Change Profile

  void changeProfile(String name, String status) {
    final date = DateTime.now().toIso8601String();
    //Update data ke firestore
    CollectionReference users = firestore.collection("users");
    users.doc(currentUsers!.email).update({
      "name": name,
      "status": status,
      "lastSignInTime":
          currentUsers!.metadata.lastSignInTime!.toIso8601String(),
      "updatedTime": date,
    });

    //update beberapa parameter ke model
    authController.usersModel.update((user) {
      user!.name = name;
      user.status = status;
      user.lastSignInTime =
          currentUsers!.metadata.lastSignInTime!.toIso8601String();
      user.updatedTime = date;
    });

    authController.usersModel.refresh();
    Get.defaultDialog(
      title: "Success",
      middleText: "Updated Profile is Success",
      textConfirm: "Ok",
      confirmTextColor: Colors.white,
      buttonColor: Colors.pink[400],
      onConfirm: () {
        Get.offAllNamed(Routes.PROFILE);
      },
      barrierDismissible: false,
    );
  }
}
