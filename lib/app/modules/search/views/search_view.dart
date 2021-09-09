import 'package:chatapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  final List<Widget> myFriends = List.generate(
    20,
    (index) => ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black26,
        child: Image.asset(
          "assets/logo/noimage.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        "Orang ke ${index + 1}",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "orang${index + 1}@gmail.com",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      trailing: GestureDetector(
        onTap: () => Get.toNamed(Routes.CHAT_ROOM),
        child: Chip(
          label: Text("Message"),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.pink[300],
          title: Text('Search'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back),
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.fromLTRB(40, 50, 40, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: controller.searchController,
                cursorColor: Colors.pink[400],
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  hintText: "Search friends here...",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 18,
                  ),
                  suffixIcon: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.pink[400],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(140),
      ),
      body: myFriends == 0
          ? Center(
              child: Container(
                width: Get.width * 0.7,
                height: Get.width * 0.7,
                child: Lottie.asset(
                  "assets/lottie/empty.json",
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: myFriends.length,
              itemBuilder: (BuildContext context, int index) {
                return myFriends[index];
              },
            ),
    );
  }
}
