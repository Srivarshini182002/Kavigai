import 'package:flutter/material.dart';

class GoalTypeDropdown extends StatelessWidget {
  final String? selectedGoalType;
  final ValueChanged<String?> onChanged;

  const GoalTypeDropdown({
    required this.selectedGoalType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Select Goal Type:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(width: 10),
        DropdownButton<String>(
          value: selectedGoalType,
          onChanged: onChanged,
          items: <String>['Select Goal Type', 'New', 'Existing'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
