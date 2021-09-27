import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:chatapp/app/data/models/users_model_model.dart';
import 'package:chatapp/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStatusController extends GetxController {
  final authController = Get.find<AuthController>();
  late TextEditingController updateStatusController;

  //usermodel kita jadikan obs karena untuk di observasi di getx

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    updateStatusController = TextEditingController();
    super.onInit();
  }

  void changeStatus(String status) {
    CollectionReference users = firestore.collection("users");

    users.doc(currentUser!.email).update({
      "status": status,
      "lastSignInTime": currentUser!.metadata.lastSignInTime!.toIso8601String(),
      "updatedTime": DateTime.now().toIso8601String(),
    });

    authController.usersModel.update((user) {
      user!.status = status;
      user.lastSignInTime =
          currentUser!.metadata.lastSignInTime!.toIso8601String();
      user.updatedTime = DateTime.now().toIso8601String();
    });
    // usersModel.update((user) {
    //   user!.status = status;
    //   user.lastSignInTime =
    //       currentUser!.metadata.lastSignInTime!.toIso8601String();
    //   user.updatedTime = DateTime.now().toIso8601String();
    // });
    // usersModel = UsersModel(
    //   status: status,
    //   lastSignInTime: currentUser!.metadata.lastSignInTime!.toIso8601String(),
    //   updatedTime: DateTime.now().toIso8601String(),
    // );

    // print(usersModel.value.status);

    Get.defaultDialog(
        title: "Success",
        middleText: "Update Status is Successfull",
        confirmTextColor: Colors.white,
        buttonColor: Colors.pink[400],
        textConfirm: "Ok",
        barrierDismissible: false,
        onConfirm: () {
          Get.offAllNamed(Routes.PROFILE);
        });
  }

  @override
  void onClose() {
    updateStatusController.dispose();
    super.onClose();
  }
}
