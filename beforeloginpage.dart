import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fv_aplication/page2/loginpage.dart';
import 'package:fv_aplication/page2/registerpage.dart';

class BeforeLoginPage extends StatelessWidget {
  const BeforeLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationWidget(),
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    BeforeLogin(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
    );
  }
}

class BeforeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 500,
            height: 250,
            color: Color.fromARGB(255, 0, 128, 128),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[300],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('image/profil.png'),
                    ),
                  ),
                ),
                Positioned(
                top: 160,
                child: Column(
                  children: [
                  Text(
                    '@Nama Pengguna',
                    style: TextStyle(
                      fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text(
                          'pengguna@gmail.com',
                          style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 390,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1.0, 1.0),
                ),
              ],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: 
                  (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                      ));
                  }, child: Text("Daftar"), 
                  style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 128, 128),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text("atau"),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginPage(),
                      ));
                  }, child: Text("Masuk"),
                  style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 128, 128),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
