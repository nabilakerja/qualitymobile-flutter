// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/dropdown.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class CBRFieldPage extends StatefulWidget {
  const CBRFieldPage({super.key});

  @override
  _CBRFieldPageState createState() => _CBRFieldPageState();
}

class _CBRFieldPageState extends State<CBRFieldPage> {
  String? selectedSisi; 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'CBR Field Pekerjaan Tanah',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                const CustomInfoCard(
                      dateText: "Some Date",
                      locationText: "Some Location",
                      text: "Pangkalan Binjai",
                    ),
                Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Sumber Material"), // pilihan dari sumber material persiapan bahan
                              const TwoFieldsWithLabel(
                                label: "Sta.",),
                              const SizedBox(height: 3,),
                              DropdownWidget(
                                hintText: 'Pilih Sisi L/R',
                                label: "Sisi",
                                selectedValue: selectedSisi,
                                items: const [
                                  'L1',
                                  'L2',
                                  'L3',
                                  'R1',
                                  'R2',
                                  'R3',
                                ],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedSisi = newValue ?? 'L1';
                                  });
                                },
                              ),
                              inputFile(label: "Kalibrasi Proving Ring"),
                            ],
                          ),
                        ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 70,
                      child: Text("Time (menit)",
                      textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0,
                                    )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: 95,
                      child: const Text("Penetration (inch)",
                      textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0,
                                    )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: 95,
                      child: const Text("Read of Dial Upper",
                      textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0,
                                    )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: 95,
                      child: const Text("Load (Lbs) Upper",
                      textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0,
                                    )),
                    )
                          ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30,right: 45),
                      child: const Text("0",)),
                      textField(),textField(),textField(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: const Text("1/4",)),
                      textField(),textField(),textField(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: const Text("1/2",)),
                      textField(),textField(),textField(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30,right: 45),
                      child: const Text("1",)),
                      textField(),textField(),textField(),
                  ],
                ),
                const ButtonUpload(),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuSoil()));
                              },
                  text: 'Submit',
                  ),
            ]),),),),
    );
  }

Widget textField({obscureText = false})
{
  return Column(
    children: <Widget>[
      Container(
        width: 85,
        height: 60,
        padding: const EdgeInsets.only(top: 15),
        child: TextField(
          obscureText: obscureText,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0,
                  horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 78, 78, 78)
                ),
        
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78))
              )
          ),
        ),
      ),
      const SizedBox(height: 5,)
    ],
  );
}

  /**void _submitForm() {
    // Implement the form submission logic here
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Add your logic for handling the form data (e.g., API call, database storage, etc.)

    // Reset the form after submission
    _formKey.currentState!.reset();
  }**/
}
