import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class CustomButtonProfile extends StatelessWidget {
  const CustomButtonProfile(
      {super.key, required this.text, this.icon, this.onPressed});

  final String text;
  final IconData? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 15,
        color: textForm,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            Icon(
              icon,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
