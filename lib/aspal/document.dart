// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

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
                            inputFile(label: "Type Asphalt"),
                            inputFile(label: "Sumber Material"),
                            inputFile(label: "Sta. Persiapan"),
                          ],
                        ),
                      ),
              CustomTitle(
                        text: 'Work Permit Application',
                      ),
              /**const CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              const CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              const CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              const CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CustomTitle(
                          text: 'Work Permit Application',
                        ),
              ),
              const CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              const CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CustomTitle(
                          text: 'Work Permit Application',
                        ),
              ),
              const CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              const CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),**/
              const SizedBox(height: 16.0), // Add some spacing
              CustomTextButton(
                onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuAspal()));
                              },
                text: 'Submit',
                ),
          ]),),),
    );
  }
}
