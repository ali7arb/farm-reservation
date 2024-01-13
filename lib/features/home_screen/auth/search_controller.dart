import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxList allResult = <dynamic>[].obs;
  RxList resultList = <dynamic>[].obs;
  TextEditingController searchController = TextEditingController();

  void onSearchChanged() {
    searchResultList();
  }

  void searchResultList() {
    var shoeResults = <dynamic>[];
    if (searchController.text.isNotEmpty) {
      for (var farmSnapShot in allResult) {
        var name = farmSnapShot['name'].toString().toLowerCase();
        if (name.contains(searchController.text.toLowerCase())) {
          shoeResults.add(farmSnapShot);
        }
      }
    } else {
      shoeResults = List.from(allResult);
    }
    resultList.value = shoeResults;
  }

  Future<void> getFarmViaName() async {
    var data = await FirebaseFirestore.instance
        .collection('Farms')
        .orderBy('name')
        .get();
    allResult.assignAll(data.docs);
    searchResultList();
  }

  @override
  void onInit() {
    searchController.addListener(onSearchChanged);
    getFarmViaName();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.onClose();
  }
}
