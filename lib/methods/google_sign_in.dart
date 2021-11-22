// ignore_for_file: unrelated_type_equality_checks, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  //this variable holds all the info of user which is signed in
  GoogleSignInAccount? _user;

  //getter
  GoogleSignInAccount get user => _user!;

  //method which executed every time when we click sign up button
  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn
          .signIn(); //pop-up to choose sign in account and store it in variable

      if (googleUser == Null) return;
      _user = googleUser;

      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
