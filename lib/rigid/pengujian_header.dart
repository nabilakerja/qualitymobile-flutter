// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/rigid/menu.dart';
import 'package:hki_quality/rigid/pengujian_detail.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class TestingHeaderPage extends StatefulWidget {
  const TestingHeaderPage({super.key});

  @override
  _TestingHeaderPageState createState() => _TestingHeaderPageState();
}

class _TestingHeaderPageState extends State<TestingHeaderPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pengujian Pekerjaan Rigid',
        
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
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Tanggal Pengecoran"),
                              inputFile(label: "Kelas Beton"),
                              inputFile(label: "Fs/Fc"),
                              inputFile(label: "Sampel Beton"),
                              inputFile(label: "Batching Plan"),
                              const TwoFieldsWithLabel(
                                label: "Sta.", controller1: null, controller2: null,),
                              inputFile(label: "Sisi"),
                            ],
                          ),
                        ),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuRigid()));
                              },
                  text: 'Submit',
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(text: 'Compaction Experiment'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 150,
                        child: Column(
                          children: [
                            IconButton(
                                      onPressed: () {
                                        {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PengujianDetailFormPage()));
                                          }
                                      },
                                      icon: Image.asset(
                                        "assets/image/7day.png",
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                        //color: const Color.fromARGB(255, 255, 0, 0),
                                      ),
                                    ),
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text("7 Days Flexural Strength Testing",)),
                          ],
                        )

                      ),
                      SizedBox(width: 150,
                        child: Column(
                          children: [
                            IconButton(
                                      onPressed: () {
                                        {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PengujianDetailFormPage()));
                                          }
                                      },
                                      icon: Image.asset(
                                        "assets/image/28day.png",
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                        //color: const Color.fromARGB(255, 255, 0, 0),
                                      ),
                                    ),
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text("28 Days Flexural Strength Testing",)),
                          ],
                        )

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(text: 'Summary of Flexural Strength Testing'),
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
                      DataColumn(label: Text('Sample 7 day')),
                      DataColumn(label: Text('Sample 28 Day')),
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
