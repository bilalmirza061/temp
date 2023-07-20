import 'package:flutter/material.dart';


class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({Key? key, required this.onChange, required this.value})
      : super(key: key);

  final bool value;
  final Function(bool?) onChange;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: onChange,
      value: value,
      activeColor: Colors.green,
      checkColor: Colors.amberAccent,

    );
  }
}
