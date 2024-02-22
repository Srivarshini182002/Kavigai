import 'package:flutter/material.dart';

class GoalField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const GoalField({
    required this.label,
    required this.hintText,
    required this.controller,
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
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
