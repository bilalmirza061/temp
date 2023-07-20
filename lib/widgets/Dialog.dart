import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key, required this.title, required this.msg}) : super(key: key);
  final String title;
  final String msg;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(title),
      content: Text(msg),
      icon: const Icon(Icons.error),
      actions: [
        TextButton(
          
          onPressed: () {
            Navigator.pop(context, 'OK');
          }, 
          child: const Text('Ok'),
          
        ),
        TextButton(

          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
          child: const Text('Cancel'),

        ),
      ],
    );
  }
}

class DialogWidgetDatePicker extends StatelessWidget {
  const DialogWidgetDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime.utc(1980),
        lastDate: DateTime.utc(2090),
        helpText: "Please Select Date!",

    );
  }
}

class DialogWidgetTimePicker extends StatelessWidget {
  const DialogWidgetTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimePickerDialog(
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dial,
    );
  }
}


