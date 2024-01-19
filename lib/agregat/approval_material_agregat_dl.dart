// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/input_file.dart';

class ApprovalMaterialAgregatDLFormPage extends StatefulWidget {
  const ApprovalMaterialAgregatDLFormPage({super.key});

  @override
  _ApprovalMaterialAgregatDLFormPageState createState() => _ApprovalMaterialAgregatDLFormPageState();
}

class _ApprovalMaterialAgregatDLFormPageState extends State<ApprovalMaterialAgregatDLFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Approval Material Agregat Drainage Layer',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                  /**const CustomInfoCard(
                      //dateText: "Some Date",
                      locationText: "Some Location",
                      project: "Pangkalan Binjai",
                    ),**/
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
                              inputFile(label: "Max Dry Density (MDD)", suffixText: "gr/cm3"),
                              inputFile(label: "Optimum Moisture Content", suffixText: "%"),
                              inputFile(label: "SGR Eff", suffixText: "gr/cm3"),
                              inputFile(label: "CBR at 100% MDD after 4 days soaked", suffixText: "%"),
                              inputFile(label: "Sweeling", suffixText: "%"),
                              inputFile(label: "Keausan Agregat", suffixText: "%"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitle(
                            text: 'Analisis Saringan',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "37,5 mm | 1,5 inchi", suffixText: "%"),
                              inputFile(label: "25 mm | 1 inchi", suffixText: "%"),
                              inputFile(label: "19 mm | 0,75 inchi", suffixText: "%"),
                              inputFile(label: "12,5 mm | 0,5 inchi", suffixText: "%"),
                              inputFile(label: "9,5 mm | 0,375 inchi", suffixText: "%"),
                              inputFile(label: "4,75 mm | No.4", suffixText: "%"),
                              inputFile(label: "31,18 mm | No.16", suffixText: "%"),
                              inputFile(label: "Uniformity Coefficient", suffixText: "%"),
                              inputFile(label: "Liquid Limit", suffixText: "%"),
                              inputFile(label: "Plastic Limit", suffixText: "%"),
                              inputFile(label: "Plastic Index", suffixText: "%"),
                              inputFile(label: "Gumpalan dan butiran tanah liat yang mudah pecah menjadi agregat", suffixText: "%"),
                              inputFile(label: "Angularitas", suffixText: "%"),
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
