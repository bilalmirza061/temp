import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/controllers/GoogleSignInController.dart';
import 'package:temp/firebase_options.dart';
import 'package:temp/screens/Signup_Screen.dart';
import 'package:temp/widgets/BottomNavBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xffc7e6ed),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget? childWidget;

  @override
  void initState() {
    super.initState();
    checkUserAuth();
  }

  checkUserAuth() {
    if (FirebaseAuth.instance.currentUser == null) {
      childWidget = const SignUpPage();
    } else {
      childWidget = const BottomNavBarEx();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childWidget ?? const CircularProgressIndicator(),
    );
  }
}
