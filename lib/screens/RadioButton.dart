import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum NameCharacter { Bilal, Mirza, Ahmed, Ali }

class RadioButtonPrac extends StatefulWidget {
  const RadioButtonPrac({
    Key? key,
    required this.red,
    required this.green,
    required this.blue,
  }) : super(key: key);
  final int red;
  final int green;
  final int blue;

  @override
  State<RadioButtonPrac> createState() => _RadioButtonPracState();
}

class _RadioButtonPracState extends State<RadioButtonPrac> {
  NameCharacter _nameCharacter = NameCharacter.Bilal;

  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: Container(
        width: width,
        height: height * 0.4,
        decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.deepOrange, width: 4,style: BorderStyle.solid),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            shape: BoxShape.rectangle,
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(widget.red, widget.green, widget.blue, 3),
                Colors.white
              ],
            )),
        child: Column(
          children: [
            buildRadioButton('Bilal', NameCharacter.Bilal),
            buildRadioButton('Ali', NameCharacter.Ali),
            buildRadioButton('Ahmed', NameCharacter.Ahmed),
            buildRadioButton('Mirza', NameCharacter.Mirza),
          ],
        ),
      ),
    );
  }

  ListTile buildRadioButton(String title, NameCharacter nameCharacter) {
    return ListTile(
        title: Text(title,
            style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontFamily: 'Times')),
        leading: Radio<NameCharacter>(
          value: nameCharacter,
          groupValue: _nameCharacter,
          onChanged: (NameCharacter? value) {
            setState(() {
              _nameCharacter = value!;
            });
          },
        ));
  }
}
