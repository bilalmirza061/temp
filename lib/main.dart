import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:temp/firebase_options.dart';
import 'package:temp/screens/Signup_Screen.dart';
import 'package:temp/widgets/BottomNavBar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          scaffoldBackgroundColor:  const Color(0xffc7e6ed),
      ),
      home: const SignUpPage(),
    );
  }
}


