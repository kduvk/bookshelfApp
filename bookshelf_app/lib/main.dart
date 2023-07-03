import 'package:flutter/material.dart';
import 'package:bookshelf_app/screens/login/login.dart';
import 'package:bookshelf_app/states/currentUser.dart';
import 'package:provider/provider.dart';
import 'package:bookshelf_app/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrentUser>(
      create: (_) => CurrentUser(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const OLogin(),
          '/home': (context) => const OHome(),
        },
      ),
    );
  }
}
