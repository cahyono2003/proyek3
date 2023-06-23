import 'package:flutter/material.dart';
import 'package:fv_aplication/main.dart';
import 'package:intl/intl.dart';


class RegisterMitra extends StatefulWidget {
  const RegisterMitra({super.key});

  @override
  State<RegisterMitra> createState() => _RegisterMitraState();
}

class _RegisterMitraState extends State<RegisterMitra> {
  bool isHidden = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  DateTime selectDate = DateTime.now();

  @override
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
                height: 780,
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
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
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
                          controller: emailC,
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
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nama Mitra",
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
                          controller: passC,
                          autocorrect: false,
                          obscureText: isHidden,
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
                                if (isHidden == true ) {
                                  isHidden = false;
                                } else {
                                  isHidden = true;
                                }
                                setState(() {});
                              } , 
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
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          keyboardType: TextInputType.number,
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
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Lahir",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 290,
                      height: 49,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              '$tanggal_lahir',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: IconButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: selectDate,
                                  firstDate: selectDate.subtract(Duration(days: 30)),
                                  lastDate: DateTime(selectDate.year + 1),
                                  initialEntryMode: DatePickerEntryMode.input)
                                  .then((value) {
                                    if (value != null)
                                    setState(() {
                                      selectDate = value;
                                  });
                                  String formattedText = DateFormat('dd/MM/yyyy').format(selectDate);
                                  print(formattedText);
                                  });
                              },
                              icon: Icon(Icons.arrow_drop_down),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
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
