// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/soil/sandconetanah_detail_list.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/title_custom_button.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class SandconeHeaderPage extends StatefulWidget {
  const SandconeHeaderPage({super.key});

  @override
  _SandconeHeaderPageState createState() => _SandconeHeaderPageState();
}

class _SandconeHeaderPageState extends State<SandconeHeaderPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sandcone Tanah',
        
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
                              inputFile(label: "Sumber Material"), // pilihan dari sumber material persiapan bahan
                              const TwoFieldsWithLabel(
                                label: "Sta.",),
                              inputFile(label: "Max Dry Density (MDD)",suffixText: "gram"), // otomatis terisi dari persiapan bahan dengan sumber material yang dipilih
                              inputFile(label: "Optimum Moisture Content (OMC)",suffixText: "%"), // otomatis terisi dari persiapan bahan dengan sumber material yang dipilih
                            ],
                          ),
                        ),
                CustomTitleButton(
                  title: 'Field Density Test',
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ListSandconeTanahDetail()));
                              },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(text: 'Summary of Sandcone Soil Testing'),
                ),
                const SizedBox(height: 10.0), // Add some spacing
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black), // Add border to DataTable
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Side')),
                      DataColumn(label: Text('Wt.Content')),
                      DataColumn(label: Text('Density')),
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
