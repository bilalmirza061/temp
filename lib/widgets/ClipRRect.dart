
import 'package:flutter/material.dart';

class ClipRRectWidget extends StatelessWidget {
  const ClipRRectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent,width: 3,style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(50)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset('assets/images/IMG_1363.heic',fit: BoxFit.cover,),
        ),

    );
  }
}
