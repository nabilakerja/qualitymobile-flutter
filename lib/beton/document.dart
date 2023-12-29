import 'package:flutter/material.dart';
import 'package:hki_quality/beton/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/cont_slider.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Kelengkapan Dokumen Persiapan',
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
          child: Column(
            children: <Widget>[
              const CustomInfoCard(
                      dateText: "Some Date",
                      locationText: "Some Location",
                      text: "Pangkalan Binjai",
                    ),
              Container(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Column(
                          children: <Widget>[
                            inputFile(label: "Sumber Material"),
                            inputFile(label: "Sta. Persiapan"),
                          ],
                        ),
                      ),
              CustomTitle(
                        text: 'Work Permit Application',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: CustomTitle(
                          text: 'Work Permit Application',
                        ),
              ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: CustomTitle(
                          text: 'Work Permit Application',
                        ),
              ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              SizedBox(height: 16.0), // Add some spacing
              CustomTextButton(
                onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuBeton()));
                              },
                text: 'Submit',
                ),
          ]),),),
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
