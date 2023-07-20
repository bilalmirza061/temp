import 'package:flutter/material.dart';

class ClipOvalExample extends StatelessWidget {
  const ClipOvalExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: Colors.blue.shade900,
            width: 5,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignInside),
      ),
      child: ClipOval(
          child: Image.asset(
        'assets/images/IMG_1363.heic',
        fit: BoxFit.cover,
        height: 190,
        width: 190,
      )),
    );
  }
}
