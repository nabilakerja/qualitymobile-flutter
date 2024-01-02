// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/rigid/pengujian_header.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';

class PengujianDetailFormPage extends StatefulWidget {
  const PengujianDetailFormPage({super.key});

  @override
  _PengujianDetailFormPageState createState() => _PengujianDetailFormPageState();
}

class _PengujianDetailFormPageState extends State<PengujianDetailFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Pengujian Pekerjaan Rigid',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Tanggal Pengujian"),
                              inputFile(label: "Slump", suffixText: "cm"),
                              inputFile(label: "Weight", suffixText: "gram"),
                              inputFile(label: "Density", suffixText: "gram/cc"),
                              inputFile(label: "Load", suffixText: "K/N"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Flexure (Kg/Cm3)',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Beam"),
                              inputFile(label: "%"),
                              inputFile(label: "Volume / Jumlah benda uji", suffixText: "m3/pcs"),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16.0), // Add some spacing
                        CustomTextButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const TestingHeaderPage()));
                              },
                          text: 'Submit',
                        ),
            ]),),),),
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
