import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/BottomNavBar.dart';
import '../widgets/LoaderDialog.dart';
import 'SignIn_Screen.dart';

class SignInPhone extends StatefulWidget {
  const SignInPhone({Key? key}) : super(key: key);

  @override
  State<SignInPhone> createState() => _SignInPhoneState();
}

class _SignInPhoneState extends State<SignInPhone> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _verifyController = TextEditingController();
  bool readOnly = false;
  String _verificationId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
               TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    label: Text("Enter Phone Number"),
                  ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: _verifyPhoneNumber,
                  child: const Text("Sign In")
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _verifyController,
                keyboardType: TextInputType.number,
                readOnly: readOnly,
                onChanged:(va) {
                  if(va.length==6){
                    _signInWithPhoneNumber(va);
                  }

                },
                decoration: const InputDecoration(labelText: 'Enter Verification Code'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Alternate method"),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                label: const Text("Sign In With Email"),
                icon: const Icon(Icons.login_rounded),
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>const SignIn()), ModalRoute.withName("/Home"));
                },
              ),

            ],
          ),

        ),
      ),
    );
  }

  Future<void> _verifyPhoneNumber() async {
    String phoneNumber = _phoneController.text.trim(); // Change the country code as needed
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // This callback will be triggered automatically if the verification is done automatically,
        // e.g., when testing on an emulator where you have your phone number set up.
        // You can sign in the user directly in this callback using the provided credential.
        await _auth.signInWithCredential(credential);
        // Navigate to the next screen after successful verification.
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure, e.g., invalid phone number, too many attempts, etc.
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Future<void> _signInWithPhoneNumber(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      showDialog(context: context, builder: (builder)=> const Loading());
      await _auth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>const BottomNavBarEx()), ModalRoute.withName("/Home"));
      // Navigate to the next screen after successful verification.
    } catch (ex) {
      // Handle sign-in errors, e.g., wrong SMS code, expired code, etc.
      print("Sign-in failed: ${ex}");
      Navigator.pop(context);

    }
  }


}
