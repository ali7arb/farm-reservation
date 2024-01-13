import 'package:flutter/material.dart';

class CustemTextName extends StatelessWidget {
  const CustemTextName(
      {super.key,
      required this.name,
      this.color = Colors.black,
      this.size = 20});

  final String name;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
