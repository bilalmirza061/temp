
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 2));
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final CalendarStyle _calendarStyle = const CalendarStyle(
    todayDecoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
    weekendDecoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
    weekendTextStyle: TextStyle(color: Colors.white, fontSize: 16),
    weekNumberTextStyle: TextStyle(color: Colors.red),
    // Color for days outside the current month
    outsideDaysVisible: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.tealAccent,
            border: Border.all(color: Colors.blue,width: 3, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(1980),
            lastDay: DateTime.now().add(const Duration(days: 443344)),
            startingDayOfWeek: StartingDayOfWeek.monday,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;// update `_focusedDay` here as well
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: _calendarStyle,
            weekNumbersVisible: true,

          ),
        ),
      ),
    );
  }
}
