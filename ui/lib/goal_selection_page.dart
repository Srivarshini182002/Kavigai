import 'package:flutter/material.dart';
import 'goal_type_dropdown.dart';
import 'goal_field.dart';
import 'description_field.dart';
import 'date_field.dart';
import 'service_dropdown.dart';

class GoalSelectionPage extends StatefulWidget {
  @override
  _GoalSelectionPageState createState() => _GoalSelectionPageState();
}

class _GoalSelectionPageState extends State<GoalSelectionPage> {
  String? _selectedGoalType = 'Select Goal Type';
  String _selectedServiceType = 'Event';
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  TextEditingController _goalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'KAVIGAI',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            ClipOval(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  'assets/logoimg.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue[50],
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoalTypeDropdown(
              selectedGoalType: _selectedGoalType,
              onChanged: (newValue) {
                setState(() {
                  _selectedGoalType = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            if (_selectedGoalType != 'Select Goal Type')
              GoalField(
                label: 'Goal:',
                hintText: _selectedGoalType == 'New' ? 'Enter your goal' : 'Search your goal',
                controller: _goalController,
              ),
            SizedBox(height: 20),
            if (_selectedGoalType == 'New')
              DescriptionField(
                label: 'Description:',
                hintText: 'Enter description',
              ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Visibility(
                    visible: _selectedGoalType != 'Select Goal Type',
                    child: DateField(
                      label: 'Start Date:',
                      date: _startDate,
                      isStartDate: true,
                      onDateSelected: (picked) {
                        setState(() {
                          _startDate = picked;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Visibility(
                    visible: _selectedGoalType != 'Select Goal Type',
                    child: DateField(
                      label: 'End Date:',
                      date: _endDate,
                      isStartDate: false,
                      onDateSelected: (picked) {
                        setState(() {
                          _endDate = picked;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_selectedGoalType != 'Select Goal Type')
              ServiceDropdown(
                selectedServiceType: _selectedServiceType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedServiceType = newValue!;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
