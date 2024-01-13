import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.text,
    this.icon,
    this.onSaved,
    this.validator,
    required this.keyboardType,
    required this.controller,
  });

  final String text;
  final IconData? icon;
  final Function()? onSaved;
  final Function()? validator;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
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
