import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:temp/screens/SignIn_Screen.dart';
import 'package:temp/screens/Signup_Screen.dart';

import 'ClipOval.dart';
import 'Dialog.dart';
import 'GestureDetectorEx.dart';

class DrawerEx extends StatefulWidget {
  const DrawerEx({Key? key}) : super(key: key);

  @override
  State<DrawerEx> createState() => _DrawerExState();
}

class _DrawerExState extends State<DrawerEx> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      surfaceTintColor: Colors.red,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: Text(
                      'Bilal\'s Application',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontFamily: 'Times',
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  ClipOvalExample(),
                ],
              )),
          buildListTileItem(
              'Add Photo', Icons.add_a_photo, 'Please add a photo!',const DialogWidgetDatePicker()),
          buildListTileItem(
              'Add Alert', Icons.add_alert, 'Please add an alert!', const DialogWidgetDatePicker()),
          buildListTileItem('Add Call', Icons.add_call, 'Please add a call!', const DialogWidgetDatePicker()),
          buildListTileItem('Logout', Icons.logout, 'Logout!', const SignIn()),
        ],
      ),
    );
  }

  ListTile buildListTileItem(String title, IconData icon, String errorMsg, Widget widget) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      tileColor: Colors.amber[200],
      onTap: () {
        Navigator.of(context).pop();
        if(widget is SignIn){
          FirebaseAuth.instance.signOut();
          print('sldkjf');
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>widget),ModalRoute.withName("/SignIn"));
        }
      },
    );
  }
}
