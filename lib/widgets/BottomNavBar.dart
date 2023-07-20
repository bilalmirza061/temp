import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/ImagePageContent.dart';
import '../screens/MainPageContent.dart';
import '../screens/Rows.dart';
import '../screens/SignIn_Screen.dart';
import 'Calender.dart';
import 'Dialog.dart';
import 'Drawer.dart';
import 'DropDownButton.dart';
import 'GestureDetectorEx.dart';
import 'ChartEx.dart';
import 'LoaderDialog.dart';

class BottomNavBarEx extends StatefulWidget{
  const BottomNavBarEx({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavBar();

}

class _BottomNavBar extends State<BottomNavBarEx> {

  static const List<Widget> screens = <Widget>[
    RowDemo(),
    ImagePageContent(),
    CalendarWidget(),
    GestureDetectorEx(),
    DDButton(),
  ];

  static const List<String> appTitles = [
    'Alarm Page',
    'My Profile',
    'Calendar',
    'Light',
    'Buttons',
  ];
  
  static const List<Color> colors = [
    Colors.lightGreen,
    Colors.tealAccent,
    Colors.amber,
    Colors.blue,
    Colors.purple,
  ];
  static int currentIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(appTitles.elementAt(currentIndex)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.accessibility),
            tooltip: 'hello',
            color: Colors.black,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("This is an error")));
            },
            hoverColor: Colors.green,
          )
        ],
      ),
      drawer: const DrawerEx(),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Loading();
            }else if(snapshot.hasData){
               return screens[currentIndex];
            }else if(snapshot.hasError){
              return const DialogWidget(title: "Sign In With Google",msg: "ERROR!\nSomething went wrong!");
            }else{
              return const SignIn();
            }
          },
          ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: colors[currentIndex],
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Times'),
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Alarm',
              tooltip: 'Set Alarm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              tooltip: 'Open Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
              tooltip: 'Open Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb),
              label: 'Light',
              tooltip: 'Open Light',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_downward_sharp),
              label: 'Button',
              tooltip: 'Open Button',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          selectedFontSize: 20,

          onTap: (value){
            setState(() {
              currentIndex = value;
              print(currentIndex);
            });
          },

        ),
      ),
    );
  }
}

