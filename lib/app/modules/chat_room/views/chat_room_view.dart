import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        leadingWidth: Get.width * 0.21,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black54,
                  child: Image.asset("assets/logo/noimage.png"),
                ),
              ],
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lorem Ipsum',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Status lorem',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        // centerTitle: false
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: ListView(
                children: [
                  ItemChat(
                    isSender: true,
                  ),
                  ItemChat(
                    isSender: false,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 15),
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      minLines: 1,
                      controller: controller.chatEmojiController,
                      cursorColor: Colors.pink[400],
                      textInputAction: TextInputAction.newline,
                      focusNode: controller.focusNode,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {
                            controller.focusNode.hasFocus;
                            controller.focusNode.unfocus();
                          },
                          icon: Icon(
                            Icons.keyboard_rounded,
                            color: Colors.pink[400],
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: Colors.pink,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.pink[400],
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Offstage(
              offstage: controller.isOffStageEmoji.isTrue,
              child: SizedBox(
                height: 325,
                child: EmojiPicker(
                  onEmojiSelected: (Category category, Emoji emoji) {
                    controller.onSelectedEmoji(emoji);
                  },
                  onBackspacePressed: () {
                    controller.onDeletedEmoji();
                  },
                  config: Config(
                      columns: 8,
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 32,
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Color(0xFFEC407A),
                      iconColor: Colors.grey,
                      iconColorSelected: Color(0xFFEC407A),
                      progressIndicatorColor: Color(0xFFEC407A),
                      backspaceColor: Color(0xFFEC407A),
                      showRecentsTab: true,
                      recentsLimit: 28,
                      noRecentsText: 'No Recents',
                      noRecentsStyle:
                          const TextStyle(fontSize: 20, color: Colors.black26),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
  }) : super(key: key);

  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      // alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.pink[400],
              borderRadius: isSender
                  ? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
            ),
            child: Text(
              "Ini adalah sebuah chat",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "10:58 PM",
            style: TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}
