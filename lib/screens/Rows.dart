import 'package:flutter/material.dart';

import 'images.dart';

class RowDemo extends StatelessWidget {
  const RowDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Center(

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                const Row(
                children: <Widget>[
                  Expanded(
                      child: Text('My name is bilal', textAlign: TextAlign.center)),
                  Expanded(
                    child: Text('Hello! My name is bilal', textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: FlutterLogo(),
                  ),

                ],
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ImagePractise()));
                  }, child: const Text('Go Back')

              ),
              Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 + 100.0,
                ),
                padding: const EdgeInsets.all(28.0),
                color: Colors.green[700],
                alignment: Alignment.topCenter,
                transform: Matrix4.rotationZ(0.2),
                child: Text('Hello World',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.amberAccent[200])),
              )

            ],
          )
        )
      ),
    );
  }
}
