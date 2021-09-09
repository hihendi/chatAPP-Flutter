import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_status_controller.dart';

class UpdateStatusView extends GetView<UpdateStatusController> {
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
        title: Text('Update Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: controller.updateStatusController,
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
                onPressed: () {},
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
