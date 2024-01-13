import 'package:flutter/material.dart';

class CustemTextButton extends StatelessWidget {
  const CustemTextButton({super.key, required this.text, this.onTap});

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
      ),
    );
  }
}
