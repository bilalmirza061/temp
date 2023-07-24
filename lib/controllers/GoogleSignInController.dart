


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/BottomNavBar.dart';


class GoogleSignInController extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;




  Future logout() async{
    try {
      googleSignIn.currentUser?.clearAuthCache();
      googleSignIn.signOut();
      user.clearAuthCache();
    }catch(ex){}
  }

}