// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/input_file.dart';

class ApprovalMaterialAgregatAFormPage extends StatefulWidget {
  const ApprovalMaterialAgregatAFormPage({super.key});

  @override
  _ApprovalMaterialAgregatAFormPageState createState() => _ApprovalMaterialAgregatAFormPageState();
}

class _ApprovalMaterialAgregatAFormPageState extends State<ApprovalMaterialAgregatAFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Approval Material Agregat Kelas A',
        
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
                            children: <Widget>[
                              inputFile(label: "Tipe Agregat"),
                              inputFile(label: "Sumber Material"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Compaction Experiment',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Yd Maksimum (MDD)"),
                              inputFile(label: "95% Yd Maksimum (MDD)", suffixText: "%"),
                              inputFile(label: "W Optimum (OMC)", suffixText: "%"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitle(
                            text: 'Atterberg Limit',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Liquid Limit", suffixText: "%"),
                              inputFile(label: "Plastic Limit", suffixText: "%"),
                              inputFile(label: "Plastic Index", suffixText: "%"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitle(
                            text: 'CBR Laboratorium',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "CBR Laboratorium (100%)", suffixText: "%"),
                              inputFile(label: "Keausan Agregat", suffixText: "%"),
                              inputFile(label: "Gravitasi Spesifik", suffixText: "%"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitle(
                            text: 'Base A Mixture Proportions',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Split 2-3", suffixText: "%"),
                              inputFile(label: "Split 1-2", suffixText: "%"),
                              inputFile(label: "Split 1-1", suffixText: "%"),
                              inputFile(label: "Abu Batu", suffixText: "%"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitle(
                            text: 'Sieve Analysis',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "1,5”", suffixText: "%"),
                              inputFile(label: "1”", suffixText: "%"),
                              inputFile(label: "3/8”", suffixText: "%"),
                              inputFile(label: "No.4", suffixText: "%"),
                              inputFile(label: "No.10", suffixText: "%"),
                              inputFile(label: "No.40", suffixText: "%"),
                              inputFile(label: "No.200", suffixText: "%"),
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
