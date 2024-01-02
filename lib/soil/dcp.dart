// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';


class DCPFormPage extends StatefulWidget {
  const DCPFormPage({super.key});

  @override
  _DCPFormPageState createState() => _DCPFormPageState();
}

class _DCPFormPageState extends State<DCPFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dynamic Cone Penetrometer Tanah',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 30,right: 30,bottom: 20),
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
                              inputFile(label: "Tested by"),
                              inputFile(label: "Pack items"),
                              inputFile(label: "Material"),
                              const TwoFieldsWithLabel(
                                label: "Sta.",),
                            ],
                          ),
                        ),
                CustomTitle(
                          text: 'Field Data',
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
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black), // Add border to DataTable
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Tumbukan')),
                      DataColumn(label: Text('Pembacaan Mistar')),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuSoil()));
                              },
                  text: 'Submit',
                  ),
            ]),),),),
    );
  }
}
Future<void> _showAddItemDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dynamic Cone Penetrometer'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField('Tumbukan',''),
                _buildInputField('Pembacaan Mistar','cm'),
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
  Widget _buildInputField(String labelText, suffixText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          suffixText: suffixText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

