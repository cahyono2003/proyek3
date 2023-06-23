import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/cekpesananpage.dart';
import 'package:fv_aplication/page1/formpemesananpage.dart';
import 'package:fv_aplication/page1/paymentpage.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fv_aplication/page1/prosespage.dart';

class TransaksiPage extends StatelessWidget {
  const TransaksiPage({super.key});

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
    Transaksi(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProsesPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
        title: Text(
          "Transfer Bank",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PaymentPage(),
            ));
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: _children[_currentIndex],
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
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: "BAYAR"),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
        ],
      ),
    );
  }
}

class Transaksi extends StatelessWidget {
    List<String> data1 = [
    "Mobile Banking",
    "ATM",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 17, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selesaikan Pembayaran Anda",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
        SizedBox(height: 35),
        Container(
          width: 375,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text("Transfer Ke",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
                ),
              ),
              SizedBox(width: 150),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top :10),
                    child: Text("1234567890",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Fv App",
                    style: TextStyle(
                      fontSize: 15
                    ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 375,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text("Total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
                ),
              ),
              SizedBox(width: 200),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text("Rp 1.005.000",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 375,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text("Instruksi Transfer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 375,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true, fit: FlexFit.loose),
                items: data1,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    
                  ),
                ),
                onChanged: print,
                selectedItem: "Mobile Banking",
              ),
          ),
        ),
      ],
    );
  }
}
