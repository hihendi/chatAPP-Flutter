import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  var isOffStageEmoji = true.obs;

  late FocusNode focusNode;
  late TextEditingController chatEmojiController;

  void onSelectedEmoji(Emoji emoji) {
    chatEmojiController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: chatEmojiController.text.length));
  }

  void onDeletedEmoji() {
    chatEmojiController
      ..text = chatEmojiController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: chatEmojiController.text.length));
  }

  @override
  void onInit() {
    chatEmojiController = TextEditingController();
    focusNode = FocusNode();

    super.onInit();
  }

  @override
  void onClose() {
    focusNode.dispose();
    chatEmojiController.dispose();
    super.onClose();
  }
}
