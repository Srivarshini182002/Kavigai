import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final String label;
  final DateTime date;
  final bool isStartDate;
  final Function(DateTime) onDateSelected;

  const DateField({
    required this.label,
    required this.date,
    required this.isStartDate,
    required this.onDateSelected,
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
            hintText: 'YYYY-MM-DD',
            prefixIcon: IconButton(
              onPressed: () => _selectDate(context),
              icon: Icon(Icons.calendar_today),
            ),
          ),
          keyboardType: TextInputType.datetime,
          readOnly: true,
          controller: TextEditingController(
            text: DateFormat('yyyy-MM-dd').format(date),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) { // Only call onDateSelected if a date is picked
      onDateSelected(picked);
    }
  }
}
