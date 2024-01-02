// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/rigid/menu.dart';
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
        title: 'Pelaksanaan Pekerjaan Rigid',
        
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
                          text: 'Uji Slump (5 ± 2,5) cm.',
                        ),
                CustomContainerSlider2(
                          text: 'Beton dihampar dengan tebal yang sama dan tidak terjadi segregasi.',
                        ),
                CustomContainerSlider2(
                          text: 'Jika dikerjakan bersambungan dengan lajur perkerasan yang telah selesai lebih dahulu, dan peralatan mekanik harus bekerja di atas lajur tersebut, kekuatan beton lajur itu harus sudah mencapai sekurang- kurangnya 90% dari kekuatan beton 28 hari.',
                        ),
                CustomContainerSlider2(
                          text: 'Jika hanya peralatan finishing yang melewati lajur existing, pekerjaan ini bisa dilakukan setelah umur betonnya mencapai 3 hari.',
                        ),
                CustomContainerSlider2(
                          text: 'Setelah 24 jam elevasi beton +- 10 mm.',
                        ),
                CustomContainerSlider2(
                          text: 'Pengujian kekasaran permukaan menggunakan alat NAASRA-Meter sesuai SNI 03-3426-1994.',
                        ),
                CustomContainerSlider2(
                          text: 'Permukaan diuji memakai mal datar (straightedges) 3 m, dengan ketinggian tidak lebih dari 3 mm. Jika diantara 3 mm hingga 12,5 mm, harus ditandai dan diturunkan dengan alat gurinda. Jika lebih dari 12,5 mm, maka harus dibongkar dan diganti.',
                        ),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuRigid()));
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
