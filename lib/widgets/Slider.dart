

import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key, required this.value, required this.onChange, required this.activeColor} ) : super(key: key);
  final double value;
  final Function(double?) onChange;
  final Color activeColor;
  @override
  Widget build(BuildContext context) {
    return Slider(
      onChanged: onChange,
      value: value,
      max: 255,
      min: 0,
      activeColor: activeColor,
      inactiveColor: activeColor,
      label: value.round().toString(),

    );
  }
}
