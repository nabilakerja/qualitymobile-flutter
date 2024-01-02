// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/coredrill/detail.dart';
import 'package:hki_quality/aspal/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom_button.dart';

class HeaderCoreDrillFormPage extends StatefulWidget {
  const HeaderCoreDrillFormPage({super.key});

  @override
  _HeaderCoreDrillFormPageState createState() => _HeaderCoreDrillFormPageState();
}

class _HeaderCoreDrillFormPageState extends State<HeaderCoreDrillFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pengujian Core Drill',
        
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
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Tanggal Pengecoran"),
                              inputFile(label: "Type Asphalt"),
                              inputFile(label: "Sta. Pengujian"),
                            ],
                          ),
                        ),
                        CustomTitleButton(
                          title: 'Detail Core Drill Test',
                          onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailCoreDrill()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuAspal()));
                              },
                          text: 'Submit',
                        ),
            ]),),),),
    );
  }
}
