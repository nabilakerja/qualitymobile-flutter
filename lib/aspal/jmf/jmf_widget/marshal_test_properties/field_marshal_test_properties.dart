import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/jmf/jmf.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/input_file.dart';

class FieldMarshalTestBody extends StatefulWidget {
  @override
  _FieldMarshalTestBodyState createState() => _FieldMarshalTestBodyState();
}

class _FieldMarshalTestBodyState extends State<FieldMarshalTestBody> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15,bottom: 15),
            child: Column(
              children: <Widget>[
                inputFile(label: "Asphalt Content", suffixText: "%"),
                inputFile(label: "Rasio Partical Passing 0.075mm with Effective Asphalt"),
                inputFile(label: "Effective Asphalt"),
                inputFile(label: "Bulk Density", suffixText: "gr/cm3"),
                inputFile(label: "Max Specific Gravity", suffixText: "GMM"),
                inputFile(label: "Void In Mix (VIM)", suffixText: "%"),
                inputFile(label: "Void Mineral Aggregate (VMA)", suffixText: "%"),
                inputFile(label: "Void Filled Bitument VFB", suffixText: "%"),
                inputFile(label: "Stability", suffixText: "Kg"),
                inputFile(label: "Flow", suffixText: "mm"),
                inputFile(label: "Stability After 24 Hour at 60 derajat C", suffixText: "%"),
                inputFile(label: "Void In Mix (VIM Refusal)", suffixText: "%"),
              ],
            ),
          ),
          CustomTextButton(
                      onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => JMFFormPage()));
                          },
                      text: 'Submit',
                    ),
        ],
      ),
    );
  }
}
