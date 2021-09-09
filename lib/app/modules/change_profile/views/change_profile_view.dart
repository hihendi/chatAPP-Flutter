import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              icon: Icon(Icons.save),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: ListView(
            children: [
              AvatarGlow(
                glowColor: Colors.black45,
                child: Container(
                  width: Get.width * 0.35,
                  height: Get.width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black38,
                    image: DecorationImage(
                      image: AssetImage("assets/logo/noimage.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                endRadius: Get.width * 0.2,
                duration: Duration(seconds: 1),
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
                  onPressed: () {},
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
