// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/beton/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/cont_slider2.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class PelaksanaanPage extends StatefulWidget {
  const PelaksanaanPage({super.key});

  @override
  _PelaksanaanPageState createState() => _PelaksanaanPageState();
}

class _PelaksanaanPageState extends State<PelaksanaanPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pelaksanaan Pekerjaan Struktur Beton',
        
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
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Pekerjaan"),
                              const TwoFieldsWithLabel(
                                label: "Sta.",),
                            ],
                          ),
                        ),
                CustomContainerSlider2(
                          text: 'Uji Slump berdasarkan kelas',
                        ),
                CustomContainerSlider2(
                          text: 'Beton dihampar tidak terjadi segregasi.',
                        ),
                CustomContainerSlider2(
                          text: 'Pengujian bahan secara berkala dengan interval max 1000 m3 untuk gradasi dan max 5000 m3 untuk abrasi sedangkan untuk bahan semen dengan interval setiap maksimum pengiriman 300 ton.',
                        ),
                CustomContainerSlider2(
                          text: 'Jika pencampuran dengan alat pencampur beton manual, volume <= 60 m3, setiap max 5 m3 beton min 1 set benda uji. volume >60 m3, setelah 60 m3 tercapai, maka setiap max 10 m3 beton min diambil set benda uji.',
                        ),
                CustomContainerSlider2(
                          text: 'Jika pengecoran hasil produksi ready mix, volume <= 60 m3, diperoleh set benda uji setiap max 15 m3 beton secara acak. volume >60 m3, setelah 60 m3 tercapai, maka setiap max 20 m3 beton harus diperoleh set benda uji.',
                        ),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuBeton()));
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
