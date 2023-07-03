import 'package:flutter/material.dart';
import 'package:bookshelf_app/screens/home/home.dart';
import 'package:bookshelf_app/screens/signup/signup.dart';
import 'package:bookshelf_app/states/currentUser.dart';
import 'package:provider/provider.dart';

class OLogin extends StatelessWidget {
  const OLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context);

    String email = '';
    String password = '';

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/login.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Log In",
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    _textField("Email", (value) {
                      email = value;
                    }),
                    const SizedBox(height: 10.0),
                    _textField("Password", (value) {
                      password = value;
                    }),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (email != '' && password != '') {
                            bool success =
                                await currentUser.loginWithEmailAndPassword(
                              email,
                              password,
                              context,
                            );
                            if (success) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OHome(),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text(
                          "Log In",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OSignUp(),
                          ),
                        );
                      },
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(String label, void Function(String) onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(2.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        onChanged: onChanged,
        obscureText: label.contains("Password"),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 12.0,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
      ),
    );
  }
}
