// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/batchingplant_pencampuran.dart';
import 'package:hki_quality/screens/batchingplant_penimbangan.dart';
import 'package:hki_quality/screens/batchingplant_persediaan_material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom_button.dart';


class BatchingplantFormPage extends StatefulWidget {
  const BatchingplantFormPage({super.key});

  @override
  _BatchingplantFormPageState createState() => _BatchingplantFormPageState();
}

class _BatchingplantFormPageState extends State<BatchingplantFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Batching Plant',
        
      ),
      body: SingleChildScrollView(
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
                            inputFile(label: "Owner Batching Plant")
                          ],
                        ),
                      ),
              CustomTitleButton(
                title: 'Komponen Persediaan Material',
                onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BatchingPlantPersediaanMaterial()));
                            },
              ),
              const SizedBox(height: 15),
              CustomTitleButton(
                title: 'Komponen Penimbangan',
                onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BatchingPlantPenimbangan()));
                            },
              ),
              const SizedBox(height: 15),
              CustomTitleButton(
                title: 'Komponen Pencampuran',
                onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BatchingPlantPencampuran()));
                            },
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
          ]),),),
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

