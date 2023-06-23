import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/aplikasipage.dart';

class KrisarPage extends StatelessWidget {
  const KrisarPage({super.key});

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
    Krisar(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 128, 128),
      body: _children[_currentIndex],
    );
  }
}

class Krisar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/logo.png"),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nama Pengguna",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Center(
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Kritik & Saran",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Center(
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Container(
                      padding: EdgeInsets.only(left: 170),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AplikasiPage(),
                        ));},
                        child: Text("Kirim"),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 128, 128),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}