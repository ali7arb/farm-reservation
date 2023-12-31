import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.text,
      this.icon,
      this.onSaved,
      this.validator,
      required this.keyboardType});

  final String text;
  final IconData? icon;
  final Function()? onSaved;
  final Function()? validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        onSaved: onSaved!(),
        validator: validator!(),
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
