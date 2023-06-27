import 'package:flutter/material.dart';

class OLogin extends StatelessWidget {
  const OLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/login.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
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
                _textField("Email"),
                const SizedBox(height: 10.0),
                _textField("Password"),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // login logic
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                TextButton(
                  onPressed: () {
                    // signup logic
                  },
                  child: const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(String label) {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: TextField(
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
