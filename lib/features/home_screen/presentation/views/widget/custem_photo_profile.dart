import 'package:flutter/material.dart';

class CustemPhotoProfile extends StatelessWidget {
  const CustemPhotoProfile({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
