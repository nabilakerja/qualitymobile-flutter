// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/agregat/sandconeagregat_header.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';

class SandconeTanahDetailFormPage extends StatefulWidget {
  const SandconeTanahDetailFormPage({super.key});

  @override
  _SandconeTanahDetailFormPageState createState() => _SandconeTanahDetailFormPageState();
}

class _SandconeTanahDetailFormPageState extends State<SandconeTanahDetailFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sandcone Tanah Detail',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Sta.Point"),
                              inputFile(label: "Side"),
                              inputFile(label: "Layer"),
                              inputFile(label: "Hole Depth", suffixText: "%"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Determination Fill Hole',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Weight of sand + Bottle (before)", suffixText: "gram"),
                              inputFile(label: "Weight of sand + Bottle (after)", suffixText: "gram"),
                              inputFile(label: "Weight of Remaining Sand", suffixText: "gram"),
                              inputFile(label: "Weight of Sand In The Funnel", suffixText: "gram"),
                              inputFile(label: "Weight of Sand In The Hole", suffixText: "gram"),
                              inputFile(label: "Sand Density", suffixText: "gram"),
                              inputFile(label: "Hole Volume", suffixText: "gram"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Determine The Depth of The Hole',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Wet Weight + Pan", suffixText: "gram"),
                              inputFile(label: "Dry Weight + Pan", suffixText: "%"),
                              inputFile(label: "Pan Weight", suffixText: "gram"),
                              inputFile(label: "Water Weight", suffixText: "%"),
                              inputFile(label: "Dry Weight", suffixText: "gram"),
                              inputFile(label: "Water Content", suffixText: "gram"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Determine of Density',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Sample Weight + Pan", suffixText: "gram"),
                              inputFile(label: "Pan Weight", suffixText: "gram"),
                              inputFile(label: "Sample Weight In Hole", suffixText: "gram"),
                              inputFile(label: "Wet Weight", suffixText: "gr/cm3"),
                              inputFile(label: "Dry Weight", suffixText: "gr/cc"),
                              inputFile(label: "% Density", suffixText: "%"),
                              inputFile(label: "Density Spec", suffixText: "%"),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16.0), // Add some spacing
                        CustomTextButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SandconeHeaderPage()));
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
