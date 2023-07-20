import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 5,
              semanticsLabel: ('Hello'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Please Wait!\nSigning In...',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),

    );
  }
}
