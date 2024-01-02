// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/aspal_curah/header.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';


class SofteningFormPage extends StatefulWidget {
  const SofteningFormPage({super.key});

  @override
  _SofteningFormPageState createState() => _SofteningFormPageState();
}

class _SofteningFormPageState extends State<SofteningFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Softening Point Test',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
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
                      DataColumn(label: Text('Observed')),
                      DataColumn(label: Text('TI')),
                      DataColumn(label: Text('TII')),
                      DataColumn(label: Text('SF')),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('Row 1, Col 1')),
                        DataCell(Text('Row 1, Col 2')),
                        DataCell(Text('Row 1, Col 3')),
                        DataCell(Text('Row 1, Col 4')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Row 2, Col 1')),
                        DataCell(Text('Row 2, Col 2')),
                        DataCell(Text('Row 2, Col 3')),
                        DataCell(Text('Row 2, Col 4')),
                      ]),
                      // Add more DataRow entries as needed
                    ],
                  ),
                ),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HeaderAspalCurahFormPage()));
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
          title: const Text('Softening Point'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField('Observed'),
                _buildInputField('Time I'),
                _buildInputField('Time II'),
                _buildInputField('Softening Point'),
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

