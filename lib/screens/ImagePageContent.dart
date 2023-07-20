import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/CheckBoxWidget.dart';
import '../widgets/ClipOval.dart';
import '../widgets/GridView.dart';
import '../widgets/Slider.dart';
import '../widgets/Switch.dart';
import 'RadioButton.dart';
import 'Rows.dart';

class ImagePageContent extends StatefulWidget {
  const ImagePageContent({Key? key}) : super(key: key);

  @override
  State<ImagePageContent> createState() => _ImagePageContentState();
}

class _ImagePageContentState extends State<ImagePageContent> {
  bool val1 = false;
  bool val2 = false;
  double startValue1 = 0;
  double startValue2 = 0;
  double startValue3 = 0;

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const ClipOvalExample(),
              buildCustomCheckBox('Bilal Mirza', 'val1', val1),
              buildCustomCheckBox('Ahmed Raza', 'val2', val2),

              const Text(
                'Choose One Of The Options Below: ',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(
                height: 30,
              ),
              RadioButtonPrac(
                red: startValue1.round(),
                green: startValue2.round(),
                blue: startValue3.round(),
              ),
              Container(
                height: 35,
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Change Color: ',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SliderWidget(
                      value: startValue1,
                      onChange: (value) {
                        setState(() {
                          startValue1 = value!;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    SliderWidget(
                      value: startValue2,
                      onChange: (value) {
                        setState(() {
                          startValue2 = value!;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    SliderWidget(
                      value: startValue3,
                      onChange: (value) {
                        setState(() {
                          startValue3 = value!;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              MySwitch(
                  value: switchValue,
                  onChange: (value) {
                    setState(() {
                      switchValue = value!;
                    });
                  }),
              const CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 5,
                semanticsLabel: ('Hello'),
              ),

              const StaggeredGVEx(),

              TextButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Go Back'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const RowDemo()));
                  },
                  child: const Text('Go to Next Page')),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCustomCheckBox(String name, String val, bool value) {
    return Card(
      child: ListTile(
        leading: CustomCheckBox(
          onChange: (value) {
            setState(() {
              if (val == "val1") {
                val1 = value!;
              } else {
                val2 = value!;
              }
            });
          },
          value: value,
        ),
        title: Text(name),
        trailing: const Icon(Icons.person),
      ),
    );
  }
}
