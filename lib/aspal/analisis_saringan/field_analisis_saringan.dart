// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/input_file.dart';

class FieldAnalisisSaringanBody extends StatefulWidget {
  const FieldAnalisisSaringanBody({super.key});

  @override
  _FieldAnalisisSaringanBodyState createState() => _FieldAnalisisSaringanBodyState();
}

class _FieldAnalisisSaringanBodyState extends State<FieldAnalisisSaringanBody> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              inputFile(label: "1"),
              inputFile(label: "3/4"),
              inputFile(label: "1/2"),
              inputFile(label: "3/8"),
              inputFile(label: "#4"),
              inputFile(label: "#8"),
              inputFile(label: "#16"),
              inputFile(label: "#30"),
              inputFile(label: "#50"),
              inputFile(label: "#100"),
              inputFile(label: "#200"),
            ],
          ),
        ],
      ),
    );
  }
}
