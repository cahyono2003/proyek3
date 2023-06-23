import 'package:flutter/material.dart';
import 'package:fv_aplication/page1/loginpage.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool isHidden = true;
  TextEditingController nama_lengkap = TextEditingController();
  TextEditingController nama_pengguna = TextEditingController();
  TextEditingController no_telepon = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController kata_sandi = TextEditingController();
  TextEditingController tanggal_lahir = TextEditingController();
  TextEditingController level = TextEditingController();
  String selectedValue = "";
  DateTime selectDate = DateTime.now();

  Future _simpan() async {
    final respone = await http.post(
        Uri.parse('http://192.168.182.63/flutterapi/fvapp/register.php'),
        body: {
          'nama_lengkap': nama_lengkap.text,
          'nama_pengguna': nama_pengguna.text,
          'kata_sandi': kata_sandi.text,
          'alamat': alamat.text,
          'tanggal_lahir': DateFormat('yyyy-MM-dd').format(selectDate),
          'no_telepon': no_telepon.text,
          'level': selectedValue,
        });
    if (respone.statusCode == 200) {
      print('Data berhasil disimpan ke database');
    } else {
      print('Data tidak berhasil disimpan ke database');
    }
  }

  List<String> data1 = [
    "pelanggan",
    "mitra",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 128, 128),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 850,
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
                          "Nama Lengkap",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Center(
                        child: TextField(
                          controller: nama_lengkap,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                          controller: nama_pengguna,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Kata Sandi",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Center(
                        child: TextField(
                          controller: kata_sandi,
                          autocorrect: false,
                          obscureText: isHidden,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                if (isHidden == true) {
                                  isHidden = false;
                                } else {
                                  isHidden = true;
                                }
                                setState(() {});
                              },
                              icon: Icon(Icons.remove_red_eye),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "No. Telepon",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Center(
                        child: TextField(
                          controller: no_telepon,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Alamat",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Center(
                        child: TextField(
                          controller: alamat,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Tanggal Lahir",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Center(
                        child: TextField(
                          controller: tanggal_lahir,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
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
                                  initialEntryMode: DatePickerEntryMode.input,
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      selectDate = value;
                                      tanggal_lahir.text =
                                          DateFormat('dd/MM/yyyy')
                                              .format(selectDate);
                                    });
                                  }
                                });
                              },
                              icon: Icon(Icons.date_range_rounded),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Daftar sebagai",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                    SizedBox(height: 20),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          _simpan();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          "DAFTAR",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange[100],
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
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
      ),
    );
  }
}
