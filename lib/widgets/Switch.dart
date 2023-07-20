
import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({Key? key, required this.onChange, required this.value}) : super(key: key);
  final bool value;
  final Function(bool?) onChange;
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: value,
        onChanged: onChange,
        activeColor: Colors.green,
        activeTrackColor: Colors.greenAccent,
    );
  }
}
