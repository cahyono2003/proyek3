import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/lihatpaket.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';

class Paket extends StatefulWidget {
  @override
  State<Paket> createState() => _PaketState();
}

class _PaketState extends State<Paket> {
  List _listdata = [];
  bool _isloading = true;

  Future _getdata() async {
    try {
      final respone = await http
          .get(Uri.parse('http://192.168.182.63/flutterapi/fvapp/paket.php'));
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              child: Container(
                width: 2100,
                height: 120,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 128, 128),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "FV APP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Temukan fotografer pribadi Anda dan pilih favorit Anda.",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              itemCount: _listdata.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.100,
              ),
              itemBuilder: (BuildContext context, int index) {
                final imageUrl = _listdata[index]['gambar'];
                return buildCard(
                  context,
                  _listdata[index]['judul'],
                  Colors.white,
                  'image/preweding.png',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget buildCard(
    BuildContext context, String title, Color color, String imagePath) {
  return SingleChildScrollView(
    child: Card(
      color: color,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LihatPaket(),
          ));
        },
        child: Column(
          children: [
            Container(
              width: 175,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath),
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
            Container(
              alignment: Alignment.topLeft,
              width: 175,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: Color.fromARGB(255, 0, 128, 128),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
