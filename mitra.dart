import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/beforeloginpage.dart';
import 'package:fv_aplication/page1/pemesanan.dart';

import '../page1/paket.dart';
import 'profil.dart';

class Mitra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FV App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
    Beranda(),
    Tentang(),
    Pemesanan(),
    Profil(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pemesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuidChart(
                  title: 'Mitra 1', image: 'https://picsum.photos/200/300'),
              BuidChart(
                  title: 'Mitra 2', image: 'https://picsum.photos/200/300')
            ],
          ),
        ],
      ),
    );
  }
}

class Tentang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Page'),
    );
  }
}

class Pemesanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PemesananPage();
  }
}

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BeforeLoginPage();
  }
}

class BuidChart extends StatelessWidget {
  String title;
  String image;

  BuidChart({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(3.0, 3.0),
                  ),
                ],
      ),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Colors.teal,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: 150,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.teal,
            ),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 31,
                          child: ElevatedButton(
                            child: Text("Lihat", style: TextStyle(color: Colors.teal),),
                            style: ElevatedButton.styleFrom(primary: Colors.white,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Paket(),
                              ));
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
