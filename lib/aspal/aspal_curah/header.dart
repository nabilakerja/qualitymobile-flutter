// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/aspal_curah/softeningpoint.dart';
import 'package:hki_quality/aspal/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/title_custom_button.dart';

class HeaderAspalCurahFormPage extends StatefulWidget {
  const HeaderAspalCurahFormPage({super.key});

  @override
  _HeaderAspalCurahFormPageState createState() => _HeaderAspalCurahFormPageState();
}

class _HeaderAspalCurahFormPageState extends State<HeaderAspalCurahFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pengujian Aspal Curah',
        
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
                              inputFile(label: "Sta. Pengujian"),
                              inputFile(label: "Tanggal Pengambilan Sampel"),
                              inputFile(label: "Tanggal Pengujian"),
                              inputFile(label: "Tipe Sampel"),
                              inputFile(label: "Lokasi AMP")
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: "Penetration Test"),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Sample is heated"),
                              inputFile(label: "Sample is cured at room temperature"),
                              inputFile(label: "Sample is soaked at 5 derajat celcius"),
                              inputFile(label: "Softening Point test At 5 derajat celcius"),
                              inputFile(label: "Waterbath Temp",suffixText: "C"),
                              inputFile(label: "Equipment Temp",suffixText: "C")
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: "Specimen Code"),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              MaterialButton(onPressed: () {_showAddItemDialog(context);
                              },child: Image.asset("assets/image/plus.png"),
                              )
                              
                          ]),
                        ),
                        const SizedBox(height: 10.0), // Add some spacing
                        Container(
                          padding: const EdgeInsets.only(left: 40,right: 40),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black), // Add border to DataTable
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('Detik Ke-')),
                              DataColumn(label: Text('Specimen Code')),
                            ],
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text('Row 1, Col 1')),
                                DataCell(Text('Row 1, Col 2')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Row 2, Col 1')),
                                DataCell(Text('Row 2, Col 2')),
                              ]),
                              // Add more DataRow entries as needed
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitleButton(
                            title: 'Softening Point Test',
                            onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SofteningFormPage()));
                                        },
                            ),
                        ),
                        const ButtonUpload(),
                        const SizedBox(height: 16.0), // Add some spacing
                        CustomTextButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuAspal()));
                              },
                          text: 'Submit',
                        ),
            ]),),),),
    );
  }

Future<void> _showAddItemDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Specimen Code'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField('Detik Ke-'),
                _buildInputField('Specimen Code'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Add your logic for saving the data here
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without saving
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Helper function to build input fields
  Widget _buildInputField(String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}