import 'package:chatapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
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
                onChanged: (value) => controller.searchFriends(value),
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
      body: Obx(
        () => controller.tempSearch.length == 0
            ? Center(
                child: Container(
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: Lottie.asset("assets/lottie/empty.json"),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.tempSearch.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black26,
                    child: Image.asset(
                      "assets/logo/noimage.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "${controller.tempSearch[index]["name"]}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "${controller.tempSearch[index]["email"]}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  trailing: GestureDetector(
                    onTap: () => Get.toNamed(Routes.CHAT_ROOM),
                    child: Chip(
                      label: Text("Message"),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
