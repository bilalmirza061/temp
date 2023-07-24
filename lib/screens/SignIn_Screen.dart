import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:temp/controllers/AppleSingInController.dart';
import 'package:temp/controllers/GoogleSignInController.dart';
import 'package:temp/extras/functions.dart';
import 'package:temp/screens/Signup_Screen.dart';

import '../widgets/BottomNavBar.dart';
import '../widgets/LoaderDialog.dart';
import 'SignIn_PhoneScreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Enter Email",
                    labelText: "Enter Email",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: "Enter Password",
                    labelText: "Enter Password",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _signInWithEmail(context);
                      }
                    },
                    child: const Text("SIGN IN", style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon:
                        const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    onPressed: () async {

                      Functions.showLoaderDialog(context);
                      await googleLogin();


                    },
                    label: const Text("Sign In With Google", style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.black, size: 25,),
                    onPressed: () async {
                      await AppleSignInController().signInWithApple();
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const BottomNavBarEx()));
                    },
                    label: const Text("Sign In With Apple", style: TextStyle(fontSize: 18),),
                  )
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Don\'t have any account?', style: TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.maxFinite / 2,
                  child: TextButton.icon(
                    icon: const Icon(Icons.login),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const SignUpPage()),
                          ModalRoute.withName("/Home"));
                    },
                    label: const Text("SIGN UP", style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Alternate method", style: TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                  label: const Text("Sign In With Phone", style: TextStyle(fontSize: 18)),
                  icon: const Icon(Icons.phone_android),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const SignInPhone()),
                        ModalRoute.withName("/Home"));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithEmail(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      showDialog(context: context, builder: (builder) => const Loading());
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Navigate to the next screen after successful sign-in
        // For example, Navigator.pushReplacementNamed(context, '/home');
        Navigator.pop(context);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (builder) => const BottomNavBarEx()));
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        print(e.code);
        print('Sign in failed. Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Sign in failed. Please check your email and password.'),
          ),
        );
      }
    }
  }

  Future googleLogin() async{
    try{
      final googleUser = await GoogleSignIn().signIn();
      if(googleUser == null){
        Navigator.of(context).pop();
        return;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
          builder: (builder) => const BottomNavBarEx()), (route) => false);

    }on FirebaseAuthException catch(e){
      print(e);
    }

  }
}
