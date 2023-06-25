import 'package:flutter/material.dart';
import 'package:bookshelf_app/screens/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OLogin(),
    );
  }
}
