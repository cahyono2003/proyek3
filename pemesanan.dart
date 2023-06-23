import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/invoice.dart';

class PemesananPage extends StatelessWidget {
  const PemesananPage({super.key});

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
    // Beranda(),
    // Tentang(),
    Pemesanan(),
    // Profil(),
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

class Pemesanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 330,
              height: 620,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
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
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            labelText: "Nama Lengkap",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            labelText: "Nomor Telepon",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.streetAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            labelText: "Alamat Lengkap",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            labelText: "Pilih Paket",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            labelText: "Pilih Metode Pembayaran",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 170),
                    child: ElevatedButton(
                      onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InvoicePage(),
                      ));},
                      child: Text("Pesan"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 128, 128),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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