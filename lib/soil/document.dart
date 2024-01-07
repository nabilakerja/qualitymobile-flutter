// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/cont_slider.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/screens/kalibrasi.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/title_custom_button.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Kelengkapan Dokumen Persiapan',
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            inputFile(label: "Sumber Material"),
                            const TwoFieldsWithLabel(
                                label: "Sta.",),
                          ],
                        ),
                      ),
              CustomTitle(
                        text: 'Pengajuan Izin Kerja',
                      ),
              const CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              const CustomContainerSlider(
                        text: 'Metode Kerja',
                      ),
              const CustomContainerSlider(
                        text: 'Joint Survey',
                      ),
              const CustomContainerSlider(
                        text: 'Job Safety Analysis',
                      ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CustomTitle(
                          text: 'Alat Berat',
                        ),
              ),
              const CustomContainerSlider(
                        text: 'Sertifikat Izin Operator',
                      ),
              const CustomContainerSlider(
                        text: 'Surat Izin Layak Operasi',
                      ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CustomTitle(
                          text: 'Alat Penunjang (Jika diperlukan)',
                        ),
              ),
              const CustomContainerSlider(
                        text: 'Patok',
                      ),
              const CustomContainerSlider(
                        text: 'Sattlement Plate',
                      ),
                    const SizedBox(height: 10,),
                    const Text(
                      "Lainnya (Optional)",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        const SizedBox(
                          width: 315,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78))),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/image/iconupload.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,),
                        ),          
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CustomTitleButton(
                  title: 'Kalibrasi',
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Kalibrasi()));
                              },
                ),
              ),
              const SizedBox(height: 16.0), // Add some spacing
              CustomTextButton(
                onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuSoil()));
                              },
                text: 'Submit',
                ),
          ]),),),
    );
  }
}
