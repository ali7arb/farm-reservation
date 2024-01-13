import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class CustomButtonCalender extends StatelessWidget {
  const CustomButtonCalender(
      {super.key, required this.text, this.onPressed, required this.textColor});

  final String text;
  final Function()? onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          gradient: gradientColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
