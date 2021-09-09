import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateStatusController extends GetxController {
  late TextEditingController updateStatusController;

  @override
  void onInit() {
    updateStatusController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    updateStatusController.dispose();
    super.onClose();
  }
}
