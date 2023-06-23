import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController aniC;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    aniC = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    animation = CurvedAnimation(
      parent: aniC,
      curve: Curves.easeOutBack,
    );

    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    aniC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: animation,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 28, 255, 232),
                  Color.fromARGB(255, 0, 116, 116)
                ]),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Image.asset(width: 350, height: 350, 'image/logo1.png'),
                    CircularProgressIndicator(),
                    SizedBox(height: 140),
                    Text(
                      "FY APP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 50)
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
