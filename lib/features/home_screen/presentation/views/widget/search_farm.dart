import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../search_screen.dart';

class SearchFarm extends StatelessWidget {
  const SearchFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        Get.to(SearchScreen());
      },
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Search a Farm',
        filled: true,
        fillColor: Colors.white,
        suffixIcon: const Icon(
          Icons.search_rounded,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
