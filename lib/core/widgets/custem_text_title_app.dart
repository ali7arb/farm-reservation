import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/style.dart';

class CustemTextTitleAppBar extends StatelessWidget {
  const CustemTextTitleAppBar({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            color: textColor2,
          ),
        )),
      ],
    );
  }
}
