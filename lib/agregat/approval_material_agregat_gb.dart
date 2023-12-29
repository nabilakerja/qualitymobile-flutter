import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/input_file.dart';

class ApprovalMaterialAgregatGBFormPage extends StatefulWidget {
  @override
  _ApprovalMaterialAgregatGBFormPageState createState() => _ApprovalMaterialAgregatGBFormPageState();
}

class _ApprovalMaterialAgregatGBFormPageState extends State<ApprovalMaterialAgregatGBFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Approval Material Agregat Granular Backfill',
        
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
                              inputFile(label: "Max Dry Density (MDD)", suffixText: "gr/cm3"),
                              inputFile(label: "Optimum Moisture Content", suffixText: "%"),
                              inputFile(label: "SGR Eff", suffixText: "gr/cm3"),
                              inputFile(label: "CBR at 100% MDD after 4 days soaked", suffixText: "%"),
                              inputFile(label: "Sweeling", suffixText: "%"),
                              inputFile(label: "Keausan Agregat", suffixText: "%"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Proporsi Campuran Agregat Granular Backfill',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Split 2-3", suffixText: "%"),
                              inputFile(label: "Split 2-3 (sampel 1)", suffixText: "%"),
                              inputFile(label: "Split 2-3 (sampel 2)", suffixText: "%"),
                              inputFile(label: "Screening", suffixText: "%"),
                              inputFile(label: "Sand", suffixText: "%"),
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
                              inputFile(label: "101,6 mm | 4 inchi", suffixText: "%"),
                              inputFile(label: "4,75 mm | No.4", suffixText: "%"),
                              inputFile(label: "0,075 mm | No.200", suffixText: "%"),
                              inputFile(label: "Liquid Limit", suffixText: "%"),
                              inputFile(label: "Plastic Limit", suffixText: "%"),
                              inputFile(label: "Plastic Index", suffixText: "%"),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 15),
                          child: 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Upload a file",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                        ),),
                                        const Text("Image upload description",
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 12,
                                                ),),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.only(top: 15),
                                                  child: Column(
                                                    children: [
                                                      Image.asset("assets/image/upload.png")
                                                  ]),
                                                )
                              ],
                            ),),
                        const SizedBox(height: 16.0), // Add some spacing
                        CustomTextButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuSoil()));
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
