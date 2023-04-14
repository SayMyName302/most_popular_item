import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:popular/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    //flutter k andr wudgets use ki jaati hain
    //e.g text , icons , status bar , app bar, body ,heiarchy widgets hoti h

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      //initial route mein back slash/ replace hojata hai
      routes: {
        "/": (context) => MyHomePage(),
      },
    );
  }
}
