import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  late TextEditingController searchController;

  //membuat variable tipenya list/array untuk nantinya menapung hasil search
  var queryAwal = [].obs;
  var tempSearch = [].obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //fungsi untuk mencari teman
  void searchFriends(String data) async {
    //mengecek apakah ada inputan di textfield
    if (data.length == 0) {
      queryAwal.value = [];
      tempSearch.value = [];
    } else {
      //ini untuk membuat huruf pertama nama itu menjadi kapital
      var capitalFirstLetter =
          data.substring(0, 1).toUpperCase() + data.substring(1);

      //mengecek apakah data query kosong dan inputan textfield hanya mengetik 1 huruf
      if (queryAwal.length == 0 && data.length == 1) {
        CollectionReference users = await firestore.collection("users");

        //ini untuk mengecek apakah keyName sama dengan inputan pertama di textfield
        final keyNameResult = await users
            .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
            .get();
        //jika sama dan tidak kosong maka di looping untuk mendapatkan data query dan di simpan di queryAwal
        if (keyNameResult.docs.length > 0) {
          for (var i = 0; i < keyNameResult.docs.length; i++) {
            queryAwal.add(keyNameResult.docs[i].data() as Map<String, dynamic>);
          }
        }
      }
      //mengecek apakah queryAwal tidak kosong
      if (queryAwal.length != 0) {
        //ini fungsi untuk looping array/list di data queryAwal
        queryAwal.forEach((element) {
          //ini fungsi untuk mengecek apakah data di list name queryAwal itu sama dengan inputan di textField
          if (element["name"].startsWith(capitalFirstLetter)) {
            //jika sama masukkan ke list tempSearch
            tempSearch.add(element);
          }
        });
      }
    }
    queryAwal.refresh();
    tempSearch.refresh();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
