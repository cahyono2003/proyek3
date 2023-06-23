import 'package:flutter/material.dart';
import '../page/invoice.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

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
      body: _children[_currentIndex],
    );
  }
}

class Profil extends StatelessWidget {
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
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'pengguna@gmail.com',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
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
                child: Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Info Akun",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Nama Lengkap",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              "Pengguna",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              Icons.perm_contact_calendar_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "No. Telepon",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              "+6812907919",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Tanggal Lahir",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              "12-08-1998",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => InvoicePage()));
                                print('Text has been tapped!');
                              },
                              child: Text(
                                'Riwayat Pemesanan',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
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

// class BeforeLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color.fromARGB(255, 0, 128, 128),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 width: 500,
//                 height: 250,
//                 color: Color.fromARGB(255, 0, 128, 128),
//                 child: Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     Container(
//                       width: 150,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.grey[300],
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('image/profil.png'),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 160,
//                       child: Column(
//                         children: [
//                           Text(
//                             '@Nama Pengguna',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           SizedBox(
//                             height: 3,
//                           ),
//                           Text(
//                             'pengguna@gmail.com',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.white,
//                                 fontStyle: FontStyle.italic),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 300,
//                     height: 390,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey,
//                           spreadRadius: 1,
//                           blurRadius: 1,
//                           offset: Offset(1.0, 1.0),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => RegisterPage(),
//                               ));
//                             },
//                             child: Text("Daftar"),
//                             style: ElevatedButton.styleFrom(
//                               primary: Color.fromARGB(255, 0, 128, 128),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           Text("atau"),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => LoginPage(),
//                               ));
//                             },
//                             child: Text("Masuk"),
//                             style: ElevatedButton.styleFrom(
//                               primary: Color.fromARGB(255, 0, 128, 128),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }