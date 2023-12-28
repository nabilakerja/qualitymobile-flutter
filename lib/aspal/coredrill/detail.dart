import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/papertest/header.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom.dart';

class DetailCoreDrill extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Pengujian Core Drill',
        
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
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: "Thickness"
                          ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Thickness - 1", suffixText: "cm"),
                              inputFile(label: "Thickness - 2", suffixText: "cm"),
                              inputFile(label: "Thickness - 3", suffixText: "cm"),
                              inputFile(label: "Thickness - 4", suffixText: "cm"),
                              inputFile(label: "Rata-Rata", suffixText: "cm"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: "Weight(In Gram)"
                          ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "In Air", suffixText: "gram"),
                              inputFile(label: "In Water", suffixText: "gram"),
                              inputFile(label: "SSD", suffixText: "gram"),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Volume", suffixText: "gram"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: "Density"
                          ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Field", suffixText: "gram"),
                              inputFile(label: "LAB", suffixText: "gram"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: "Compaction"
                          ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Test", suffixText: "%"),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Remark"),
                            ],
                          ),
                        ),
                        CustomTextButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HeaderPapertestFormPage()));
                              },
                          text: 'Submit',
                        ),
            ]),),),),
    );
  }
}