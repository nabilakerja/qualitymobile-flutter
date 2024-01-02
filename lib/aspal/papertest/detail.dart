import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/papertest/header.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/input_file.dart';

class DetailPaperTest extends StatelessWidget {
  const DetailPaperTest({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Pengujian Paper Test',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Sta.Point"),
                              inputFile(label: "Side"),
                              inputFile(label: "Layer"),
                              inputFile(label: "Area of Test Paper", suffixText: "m2"),
                              inputFile(label: "Weight of paper before spreading with tack coat",suffixText: "gram"),
                              inputFile(label: "Weight of paper after spreading with tack coat",suffixText: "gram"),
                              inputFile(label: "Weight of coat applied = (4)-(3)",suffixText: "gram"),
                              inputFile(label: "(5/2) * (1/1000)", suffixText: "kg/m2"),
                            ],
                          ),
                        ),
                        CustomTextButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HeaderPapertestFormPage()));
                              },
                          text: 'Submit',
                        ),
            ]),),),),
    );
  }
}