import 'package:flutter/material.dart';
import 'package:bookshelf_app/screens/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
      home: const OLogin(),
    );
  }
}
