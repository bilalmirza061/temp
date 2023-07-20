import 'package:flutter/material.dart';

import 'Dialog.dart';

const List<String> buttons = ['One','Two','Three','Four','Five','Six','Seven','Eight','Nine','Ten','Eleven'];
class DDButton extends StatefulWidget {
  const DDButton({Key? key}) : super(key: key);

  @override
  State<DDButton> createState() => _DDButtonState();
}

class _DDButtonState extends State<DDButton> {
  String value = buttons.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          elevation: 24,
          value: value,
          menuMaxHeight: 250,
          icon: const Icon(Icons.arrow_downward_sharp, color: Colors.red,),
          iconSize: 30,
          style: const TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
          underline: Container(
            height: 3,
            color: Colors.black,
          ),
          onChanged: (val){
            setState(() {
              value = val!;
              showDialog(context: context, builder: (ctx){
                return  DialogWidget(title: val, msg: 'This is $val',);
              }
              );
            });
          },
          items: buttons.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}



