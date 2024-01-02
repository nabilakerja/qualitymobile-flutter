// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/input_file.dart';

class FieldAnalisisSaringanPlusBody extends StatefulWidget {
  const FieldAnalisisSaringanPlusBody({super.key});

  @override
  _FieldAnalisisSaringanPlusBodyState createState() => _FieldAnalisisSaringanPlusBodyState();
}

class _FieldAnalisisSaringanPlusBodyState extends State<FieldAnalisisSaringanPlusBody> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: [
            inputFile(label: "1 1/2"),
          ],
        ),
      ],
    );
  }
}
