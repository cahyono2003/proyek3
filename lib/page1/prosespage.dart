import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/aplikasipage.dart';
import 'package:fv_aplication/page1/krisarpage.dart';


class ProsesPage extends StatelessWidget {
  const ProsesPage({super.key});

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
    Proses(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AplikasiPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 20,
        iconSize: 1,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: "SELESAI"),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
        ],
      ),
    );
  }
}

class Proses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  "Memproses Reservasi Anda",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(height: 80),
              Image.asset('image/proses.png'),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  "Terima kasih! Pemesanan anda akan segera diproses",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => KrisarPage()));
                    print('Text has been tapped!');
                  },
                  child: Text(
                    'Beri Kritik & Saran...!',
                    style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
