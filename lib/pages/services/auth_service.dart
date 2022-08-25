// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firepostnew/pages/services/prefs_service.dart';
import 'package:firepostnew/pages/signin_page.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<User> signInUser(
      BuildContext context, String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
      final User user = _auth.currentUser;
      print(user.toString());
      return user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<User> signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = authResult.user;
      print(user.toString());
      return user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static signOutUser(BuildContext context) {
    _auth.signOut();
    Prefs.removeUserId().then((value) => {
          Navigator.pushReplacementNamed(context, SignInPage.id),
        });
  }
}
