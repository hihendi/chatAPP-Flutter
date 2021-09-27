import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_status_controller.dart';

class UpdateStatusView extends GetView<UpdateStatusController> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    controller.updateStatusController.text =
        authController.usersModel.value.status!;
    print(controller.updateStatusController.text);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('Update Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: controller.updateStatusController,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                controller.changeStatus(controller.updateStatusController.text);
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                labelText: "Status",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: Get.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    primary: Colors.pink[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                onPressed: () {
                  controller
                      .changeStatus(controller.updateStatusController.text);
                },
                child: Text(
                  "UPDATE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
