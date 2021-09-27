import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    controller.emailController.text =
        authController.usersModel.value.email ?? "Data Not Found";
    controller.nameController.text =
        authController.usersModel.value.name ?? "Data Not Found";
    controller.statusController.text =
        authController.usersModel.value.status ?? "";
    print(authController.usersModel.value.status);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text('Change Profile'),
          actions: [
            IconButton(
              onPressed: () {
                controller.changeProfile(controller.nameController.text,
                    controller.statusController.text);
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: ListView(
            children: [
              AvatarGlow(
                endRadius: Get.width * 0.3,
                glowColor: Colors.black54,
                duration: Duration(seconds: 1),
                child: Container(
                  margin: EdgeInsets.all(
                    20,
                  ),
                  height: Get.width * 0.5,
                  width: Get.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: (authController.usersModel.value.photoUrl == null)
                        ? Image.asset(
                            "assets/logo/noimage.png",
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            authController.usersModel.value.photoUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: controller.emailController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  fillColor: Colors.black12,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.nameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  labelText: "Name",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.statusController,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  controller.changeProfile(controller.nameController.text,
                      controller.statusController.text);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  labelText: "Status",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "No Image",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Choosen",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                    primary: Colors.pink[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {
                    controller.changeProfile(controller.nameController.text,
                        controller.statusController.text);
                  },
                  child: Text(
                    "UPDATE",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
