import 'package:flutter/material.dart';
import 'package:bookshelf_app/screens/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: OLogin(),
    );
  }
}
