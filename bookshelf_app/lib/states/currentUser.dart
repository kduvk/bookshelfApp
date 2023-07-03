import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  Future<bool> loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      Navigator.pushReplacementNamed(context, '/home');
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign In Error'),
            content: const Text('Invalid email or password.'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }
  }

  Future<bool> signUpWithEmailAndPassword(
      String name, String email, String password, BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      Navigator.pushReplacementNamed(context, '/home');
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign Up Error'),
            content: const Text('An error occurred during sign up.'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }
  }
}
