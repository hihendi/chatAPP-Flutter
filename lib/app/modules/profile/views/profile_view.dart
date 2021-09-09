import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../../../controllers/auth_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => authController.logout(),
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Get.width * 0.3),
                        color: Colors.black38,
                        image: DecorationImage(
                          image: AssetImage("assets/logo/noimage.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Lorem Ipsum",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "lorem.ipsum@gmail.com",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => Get.toNamed(Routes.UPDATE_STATUS),
                      leading: Icon(Icons.note_add_outlined),
                      title: Text(
                        "Update Status",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                      leading: Icon(Icons.person),
                      title: Text(
                        "Change Profile",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.color_lens),
                      title: Text(
                        "Change Theme",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      trailing: Text(
                        "Light",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: context.mediaQueryPadding.bottom + 10),
              child: Column(
                children: [
                  Text(
                    "Chat App",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "v.1.0",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
