import 'package:flutter/material.dart';

class ServiceDropdown extends StatelessWidget {
  final String selectedServiceType;
  final ValueChanged<String> onChanged;

  const ServiceDropdown({
    required this.selectedServiceType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        DropdownButton<String>(
          value: selectedServiceType,
          onChanged: (newValue) {
            // Call the onChanged callback with the new value
            onChanged(newValue!);
          },
          items: <String>['Event', 'Book', 'Mentor', 'URL'].map((String value) {
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
