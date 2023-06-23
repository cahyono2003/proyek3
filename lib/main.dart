import 'package:flutter/material.dart';
// import './page/loginpage.dart';
// import './page/registerpage.dart';
import './page/registermitrapage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterMitra(),
    );
  }
}

