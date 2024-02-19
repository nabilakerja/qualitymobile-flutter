import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/soil/document.dart';
import 'package:hki_quality/widget/input_file.dart';

class Kalibrasi extends StatelessWidget {
  const Kalibrasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalibrasi'),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              const Center(
                child: Text('Kalibrasi Pasir dan Tabung Alat Sandcone',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    )),
              ),
              const Text('(Khusus pengujian sandcone)',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  )),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget>[
                    inputFile(
                        label: "Rata-rata berat isi pasir (y')",
                        suffixText: "gr/cm3"),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 15),
                child: Column(children: [
                  MaterialButton(
                    onPressed: () {
                      _showAddItemDialog(context);
                    },
                    child: Image.asset("assets/image/plus.png"),
                  )
                ]),
              ),
              const SizedBox(height: 10.0), // Add some spacing
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black), // Add border to DataTable
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Corong')),
                    DataColumn(label: Text('Rata-rata berat pasir')),
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
              const SizedBox(height: 16.0), // Add some spacing
              CustomTextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DocumentPage(
                                username: loggedInUsername,
                              )));
                },
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showAddItemDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Kalibrasi'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              _buildInputField('Corong'),
              _buildInputField('Rata-rata berat pasir '),
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
