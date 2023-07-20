import 'package:flutter/material.dart';

class GestureDetectorEx extends StatefulWidget {
  const GestureDetectorEx({Key? key}) : super(key: key);

  @override
  State<GestureDetectorEx> createState() => _GestureDetectorExState();
}

class _GestureDetectorExState extends State<GestureDetectorEx> {
  bool _lightOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.lightbulb,
                size: 100,
                color: _lightOn? Colors.yellow : Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  _lightOn =!_lightOn;
                });
              },

              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  border: Border.all(color: Colors.red, width: 3, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                ),
                  alignment: Alignment.center,
                  child: Text(_lightOn? 'Turn Off' : 'Turn On', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

              ),
            )

          ],
        ),
      ),
    );
  }
}
