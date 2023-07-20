import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/Signup_Controller.dart';
import 'SignIn_Screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Enter Full Name",
                  labelText: "Enter Full Name",
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Enter Email",
                  labelText: "Enter Email",
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: "Enter Phone",
                  labelText: "Enter Phone",
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: "Enter Password",
                  labelText: "Enter Password",
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      _signUpWithEmail(context);
                    }
                  },
                  child: const Text("SIGN UP"),
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Already have an account?'),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.maxFinite/2,
                child: TextButton.icon(
                  icon: const Icon(Icons.login),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const SignIn()));
                  },
                  label: const Text("SIGN IN"),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }

  Future<void> _signUpWithEmail(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Navigate to the next screen after successful sign-up
        // For example, Navigator.pushReplacementNamed(context, '/home');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>const SignIn()));
      } catch (e) {
        print('Sign up failed. Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign up failed. Please check your email and password.'),
          ),
        );
      }
    }
  }

}




