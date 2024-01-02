// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/input_file.dart';

class FieldPropertiesTestBody extends StatefulWidget {
  const FieldPropertiesTestBody({super.key});

  @override
  _FieldPropertiesTestBodyState createState() => _FieldPropertiesTestBodyState();
}

class _FieldPropertiesTestBodyState extends State<FieldPropertiesTestBody> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              inputFile(label: "Kadar Aspal",suffixText: "%"),
              inputFile(label: "Bulk Density",suffixText: "gr/cc"),
              inputFile(label: "VAM",suffixText: "%"),
              inputFile(label: "VIM",suffixText: "%"),
              inputFile(label: "VIB",suffixText: "%"),
              inputFile(label: "VFB",suffixText: "kg"),
              inputFile(label: "Stability",suffixText: "%"),
              inputFile(label: "Marshall Sisa",suffixText: "%"),
              inputFile(label: "Flow",suffixText: "mm"),
              inputFile(label: "MQ",suffixText: "kg/mm"),
              inputFile(label: "% Bitumen Effectif",suffixText: "%"),
              inputFile(label: "% Lolos No. 200 thd K. Aspal Eff.",suffixText: "%"),
              inputFile(label: "Kepadatan Lapangan",suffixText: "%"),
            ],
          ),
        ],
      ),
    );
  }
}
