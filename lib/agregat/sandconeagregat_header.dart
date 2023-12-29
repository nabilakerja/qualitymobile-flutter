import 'package:flutter/material.dart';
import 'package:hki_quality/agregat/sandconeagregat_detail.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/title_custom_button.dart';
import 'package:hki_quality/agregat/menu.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class SandconeHeaderPage extends StatefulWidget {
  @override
  _SandconeHeaderPageState createState() => _SandconeHeaderPageState();
}

class _SandconeHeaderPageState extends State<SandconeHeaderPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sandcone Agregat',
        
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
                              inputFile(label: "Type Agregat"),
                              inputFile(label: "Sumber Material"),
                              TwoFieldsWithLabel(
                                label: "Sta.",),
                              inputFile(label: "Max Dry Density (MDD)",suffixText: "gram"),
                              inputFile(label: "Optimum Moisture Content (OMC)",suffixText: "%"),
                            ],
                          ),
                        ),
                CustomTitleButton(
                  title: 'Field Density Test',
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SandconeAgregatDetailFormPage()));
                              },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(text: 'Summary of Sandcone Aggregate Testing'),
                ),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuAgregat()));
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
