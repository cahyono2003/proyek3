import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/aplikasipage.dart';
import 'package:fv_aplication/page1/formpemesananpage.dart';
import 'package:fv_aplication/page1/paket.dart';
import 'package:fv_aplication/page1/pelangganpage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LihatPaket extends StatelessWidget {
  const LihatPaket({super.key});

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
    LihatPaketPage()
  ];

  void _onTabTapped(int index) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FromPemesananPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 20,
        iconSize: 1,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold
        ),
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: "PESAN"
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: ''
          ),
        ],
      ),
    );
  }
}

class LihatPaketPage extends StatefulWidget {
  @override
  State<LihatPaketPage> createState() => _LihatPaketPageState();
}

class _LihatPaketPageState extends State<LihatPaketPage> {
  List<dynamic> _listdata = [];
  bool _isloading = true;

  Future _getdata() async {
    try {
      final respone = await http.get(Uri.parse(
          'http://192.168.182.63/flutterapi/fvapp/paket.php')); 
      print(respone.body);
      if (respone.statusCode == 200) {
        final data = jsonDecode(respone.body);
        setState(() {
          _listdata = List.from(data);
          _isloading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    print(_listdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 500,
            height: 360,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage("image/preweding.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 5, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Paket(),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                  SizedBox(height: 200),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Kang ramdani visual story',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "${_listdata[0]['judul']}",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 185,
                  height: 185,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:NetworkImage('https://picsum.photos/185/185')
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1.0, 1.0),
                    ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                          width: 87,
                          height: 87,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey,
                            image: DecorationImage(
                            fit: BoxFit.cover,
                            image:NetworkImage('https://picsum.photos/185/100')
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                          width: 87,
                          height: 87,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey,
                            image: DecorationImage(
                            fit: BoxFit.cover,
                            image:NetworkImage('https://picsum.photos/100/185')
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                          width: 87,
                          height: 87,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey,
                            image: DecorationImage(
                            fit: BoxFit.cover,
                            image:NetworkImage('https://picsum.photos/190/188')
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                          width: 87,
                          height: 87,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey,
                            image: DecorationImage(
                            fit: BoxFit.cover,
                            image:NetworkImage('https://picsum.photos/195/150')
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 500,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 13),
              child: Text("Daftar Isi Paket",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Detail paket",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 80),
                Text(":",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Column (
              children: [
                Text("${_listdata[0]['detail_paket']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                // SizedBox(width: 80),
                // Text(":",
                // style: TextStyle(
                //   fontSize: 15
                //   ),
                // )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Harga",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 80),
                Text("   :                          ${_listdata[0]['harga']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Fotografer               :",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 100),
                Text("${_listdata[0]['fotografer']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Kamera                    :",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 95),
                Text("${_listdata[0]['kamera']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Edit foto                  :",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 95),
                Text("${_listdata[0]['edit_foto']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Unlimited shoot     : ",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 95),
                Text("${_listdata[0]['unlimited_shoot']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Flashdisk master   :",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 95),
                Text("${_listdata[0]['flashdisk_master']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Status                      :",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 95),
                Text("${_listdata[0]['status']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Created at               :",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 95),
                Text("${_listdata[0]['created_at']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Row(
              children: [
                Text("Updated at              :",
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                SizedBox(width: 95),
                Text("${_listdata[0]['updated_at']}",
                style: TextStyle(
                  fontSize: 15
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}