import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/style.dart';

class CustemButtonWidget extends StatelessWidget {
  const CustemButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.textColor = Colors.black,
    this.gradient = gradientColor2,
  });

  final String title;
  final Function()? onPressed;
  final Color textColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: Get.size.width / 7,
        width: Get.size.height / 2,
        decoration: BoxDecoration(
          gradient: gradient,
          border: Border.all(
            color: const Color(0xff81D0F2),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
