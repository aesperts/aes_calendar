import 'package:flutter/material.dart';
import 'package:aes_calendar/aes_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalendarExample(),
    );
  }
}

class CalendarExample extends StatefulWidget {
  const CalendarExample({super.key});

  @override
  State<CalendarExample> createState() => _CalendarExampleState();
}

class _CalendarExampleState extends State<CalendarExample> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aes Calendar Example')),
      body: Center(
        child: AesCalendar(
          selectedDate: selectedDate,
          endDate: DateTime(2030),
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
      ),
    );
  }
}