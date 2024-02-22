import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  final String label;
  final String hintText;

  const DescriptionField({
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
