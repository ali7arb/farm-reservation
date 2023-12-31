import 'package:flutter/material.dart';

class SearchFarm extends StatelessWidget {
  const SearchFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
