// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/twofield.dart';


class BeritaAcaraFormPage extends StatefulWidget {
  const BeritaAcaraFormPage({super.key});

  @override
  _BeritaAcaraFormPageState createState() => _BeritaAcaraFormPageState();
}

class _BeritaAcaraFormPageState extends State<BeritaAcaraFormPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Berita Acara',
        
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
                              const TwoFieldsWithLabel(
                                label: "Sta.",),
                              inputFile(label: "Aktivitas"),
                              inputFile(label: "Keterangan"),
                            ],
                          ),
                        ),
                CustomTitle(
                          text: 'List of Attendees',
                        ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      MaterialButton(onPressed: () {_showAddItemDialog(context);
                      },child: Image.asset("assets/image/plus.png"),
                      )
                      
                  ]),
                ),
                const SizedBox(height: 10.0), // Add some spacing
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black), // Add border to DataTable
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Nama')),
                      DataColumn(label: Text('Perusahaan')),
                      DataColumn(label: Text('Jabatan')),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('Row 1, Col 1')),
                        DataCell(Text('Row 1, Col 2')),
                        DataCell(Text('Row 1, Col 3')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Row 2, Col 1')),
                        DataCell(Text('Row 2, Col 2')),
                        DataCell(Text('Row 2, Col 3')),
                      ]),
                      // Add more DataRow entries as needed
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
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
  
Future<void> _showAddItemDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Daftar Hadir'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField('Nama'),
                _buildInputField('Perusahaan'),
                _buildInputField('Jabatan'),
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