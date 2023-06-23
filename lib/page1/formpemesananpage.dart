import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/cekpesananpage.dart';
import 'package:fv_aplication/page1/lihatpaket.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/loginpage.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class FromPemesananPage extends StatelessWidget {
  const FromPemesananPage({super.key});

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
  final formKey = GlobalKey<FormState>();
  TextEditingController jenis_paket = TextEditingController();
  TextEditingController tanggal_pemotretan = TextEditingController();
  TextEditingController jam_pemotretan = TextEditingController();
  String selectedValue = "";
  DateTime selectDate = DateTime.now();
  TimeOfDay? selectedTime;

  Future<void> _simpan() async {
    final response = await http.post(
      Uri.parse('http://10.0.141.4/flutterapi/fvapp/pesan.php'),
      body: {
        'jenis_paket': selectedValue,
        'tanggal_pemotretan': DateFormat('yyyy-MM-dd').format(selectDate),
        'jam_pemotretan':
            selectedTime != null ? selectedTime!.format(context) : '',
      },
    );
    if (response.statusCode == 200) {
      print('Data berhasil disimpan ke database');
    } else {
      print('Data tidak berhasil disimpan ke database');
    }
  }

  void _showTimePicker() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
        jam_pemotretan.text =
            selectedTime != null ? selectedTime!.format(context) : '';
      });
    }
  }

  List<String> data1 = [
    "Paket Silver",
    "Paket Golden",
  ];

  int _currentIndex = 0;

  final List<Widget> _children = [
    Pemesanan(),
  ];

  void _onTabTapped(int index) {
    _simpan();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CekPesananPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
        title: Text(
          "Rencana Pemotretan",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LihatPaket(),
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
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: "LANJUT"),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
        ],
      ),
    );
  }
}

class Pemesanan extends StatefulWidget {
  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  final formKey = GlobalKey<FormState>();
  TextEditingController jenis_paket = TextEditingController();
  TextEditingController tanggal_pemotretan = TextEditingController();
  TextEditingController jam_pemotretan = TextEditingController();
  String selectedValue = "";
  DateTime selectDate = DateTime.now();
  TimeOfDay? selectedTime;

  Future<void> _simpan() async {
    final response = await http.post(
      Uri.parse('http://10.0.141.4/flutterapi/fvapp/pesan.php'),
      body: {
        'jenis_paket': selectedValue,
        'tanggal_pemotretan': DateFormat('yyyy-MM-dd').format(selectDate),
        'jam_pemotretan':
            selectedTime != null ? selectedTime!.format(context) : '',
      },
    );
    if (response.statusCode == 200) {
      print('Data berhasil disimpan ke database');
    } else {
      print('Data tidak berhasil disimpan ke database');
    }
  }

  void _showTimePicker() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
        jam_pemotretan.text =
            selectedTime != null ? selectedTime!.format(context) : '';
      });
    }
  }

  List<String> data1 = [
    "Paket Silver",
    "Paket Golden",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 35, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Buat Rencana Anda",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jenis Paket",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                    showSelectedItems: true, fit: FlexFit.loose),
                items: data1,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value ?? "";
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Atur Bulan, Tanggal dan Hari",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: TextField(
                controller: tanggal_pemotretan,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: selectDate,
                              firstDate:
                                  selectDate.subtract(Duration(days: 30)),
                              lastDate: DateTime(selectDate.year + 1),
                              initialEntryMode: DatePickerEntryMode.input)
                          .then((value) {
                        if (value != null)
                          setState(() {
                            selectDate = value;
                            String formattedText =
                                DateFormat('dd/MM/yyyy').format(selectDate);
                            print(formattedText);
                            tanggal_pemotretan.text = formattedText + '';
                          });
                      });
                    },
                    icon: Icon(Icons.date_range_outlined),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Atur Waktu",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: TextField(
                controller: jam_pemotretan,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    onPressed: _showTimePicker,
                    icon: Icon(Icons.timelapse_rounded),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
