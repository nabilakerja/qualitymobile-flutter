// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/dropdown.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/input_file.dart';

class ApprovalMaterialSoilFormPage extends StatefulWidget {
  const ApprovalMaterialSoilFormPage({super.key});

  @override
  _ApprovalMaterialSoilFormPageState createState() => _ApprovalMaterialSoilFormPageState();
}

class _ApprovalMaterialSoilFormPageState extends State<ApprovalMaterialSoilFormPage> {
  String? selectedKlasifikasiTanah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Approval Material Tanah',
        
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
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              inputFile(label: "Sumber Material"),
                              inputFile(label: "Kedalaman", suffixText: "meter"),
                              DropdownWidget(
                                hintText: 'Select Klasifikasi Tanah',
                                label: "Klasifikasi Tanah",
                                selectedValue: selectedKlasifikasiTanah,
                                items: const [
                                  'AASHTO A-4',
                                  'AASHTO A-5',
                                  'AASHTO A-6',
                                  'AASHTO A-7',
                                  'AASHTO A-7-5',
                                ],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedKlasifikasiTanah = newValue ?? 'AASHTO A-4';
                                  });
                                },
                              ),
                              inputFile(label: "Max Dry Density (MDD)", suffixText: "gram"),
                              inputFile(label: "Optimum Moisture Content (OMC)", suffixText: "%"),
                              inputFile(label: "Liquid Limit", suffixText: "%"),
                              inputFile(label: "Plastic Limit", suffixText: "%"),
                              inputFile(label: "Plastic Index", suffixText: "%"),
                              inputFile(label: "Specific Gravity", suffixText: "gr/cm3"),
                              inputFile(label: "CBR at 100% MDD after 4 days soaked", suffixText: "%"),
                              inputFile(label: "Swelling Potensial", suffixText: "%"),
                              inputFile(label: "Swelling Potensial", suffixText: "%"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Sieve Analysis (Passed)',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "4,76 mm | 4 inch", suffixText: "%"),
                              inputFile(label: "2,00 mm | 10 inch", suffixText: "%"),
                              inputFile(label: "0,42 mm | 40 inch", suffixText: "%"),
                              inputFile(label: "0,149 mm | 100 inch", suffixText: "%"),
                              inputFile(label: "0,074 mm | 200 inch", suffixText: "%"),
                            ],
                          ),
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
}
