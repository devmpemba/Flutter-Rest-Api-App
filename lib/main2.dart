import 'package:flutter/material.dart';
import 'package:testdemo/auth/PhoneScreen.dart';
import 'package:firebase_core/firebase_core.dart'; //import firebase dependency


void main() async{
  //initialize in main method
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Test App',
      home: PhoneScreen(),

    );
  }
}

