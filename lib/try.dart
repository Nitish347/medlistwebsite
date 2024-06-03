import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimePickerExample(),
    );
  }
}

class TimePickerExample extends StatefulWidget {
  @override
  _TimePickerExampleState createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _selectedDateTime = DateTime(
          _selectedDateTime.year,
          _selectedDateTime.month,
          _selectedDateTime.day,
          _selectedTime.hour,
          _selectedTime.minute,
        );
      });
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-ddTHH:mm:ss');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Selected time: ${_formatDateTime(_selectedDateTime)}',
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time'),
            ),
          ],
        ),
      ),
    );
  }
}
