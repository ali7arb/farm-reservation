import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/details_screen.dart';
import 'package:reservation_farm/model/farms/farms_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List allResult = [];

  List resultList = [];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener(onSearchChanged);
    super.initState();
  }

  onSearchChanged() {
    searchResultList();
  }

  searchResultList() {
    var shoeResults = [];
    if (searchController.text != "") {
      for (var farmSnapShot in allResult) {
        var name = farmSnapShot['name'].toString().toLowerCase();
        if (name.contains(searchController.text.toLowerCase())) {
          shoeResults.add(farmSnapShot);
        }
      }
    } else {
      shoeResults = List.from(allResult);
    }
    setState(() {
      resultList = shoeResults;
    });
  }

  getFarmViaName() async {
    var data = await FirebaseFirestore.instance
        .collection('Farms')
        .orderBy('name')
        .get();
    setState(() {
      allResult = data.docs;
    });
    searchResultList();
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getFarmViaName();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: CupertinoSearchTextField(
          controller: searchController,
        ),
      ),
      body: ListView.builder(
        itemCount: resultList.length,
        itemBuilder: (context, index) {
          FarmModel farm = FarmModel.fromJson(
              resultList[index].data() as Map<String, dynamic>);
          return ListTile(
            title: InkWell(
              onTap: () {
                Get.to(DetailsScreen(farm: farm));
              },
              child: Text(
                allResult[index]['name'],
              ),
            ),
          );
        },
      ),
    );
  }
}
