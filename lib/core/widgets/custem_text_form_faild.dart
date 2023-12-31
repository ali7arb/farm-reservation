import 'package:flutter/material.dart';

class CustemTextForm extends StatelessWidget {
  final String title;
  final Function(String?) onSave;
  final String hintText;
  final String? Function(String?) validator;

  const CustemTextForm({
    super.key,
    this.title = '',
    required this.hintText,
    required this.onSave,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 70,
          ),
          TextFormField(
            validator: validator,
            onSaved: onSave,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: const Color(0xffDDEFF8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
