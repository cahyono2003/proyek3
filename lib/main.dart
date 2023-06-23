import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/loginpage.dart';
import 'package:fv_aplication/page1/pelangganpage.dart';
import 'page1/spalshscreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

String nama_pengguna = '';
String nama_lengkap = '';
String no_telepon = '';
String tanggal_lahir = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/PelangganPage': (BuildContext context) =>
            new PelangganPage(),
        '/LoginPage': (BuildContext context) => new LoginPage(),
      },
    );
  }
}
