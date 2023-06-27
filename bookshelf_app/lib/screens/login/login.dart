import 'package:flutter/material.dart';

class OLogin extends StatelessWidget {
  const OLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Log In.",
              softWrap: true,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 16.0,
            ),
            _textField("Email"),
            const SizedBox(height: 16.0),
            _textField("Password"),
            const SizedBox(
              height: 24.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _textField(String label) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0.0, 2.0),
                blurRadius: 4.0)
          ]),
      child: TextField(
        decoration: InputDecoration(
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}
