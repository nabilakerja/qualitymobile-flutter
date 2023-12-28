import 'package:flutter/material.dart';
import 'package:hki_quality/widget/input_file.dart';

class FieldAnalisisSaringanPlusBody extends StatefulWidget {
  @override
  _FieldAnalisisSaringanPlusBodyState createState() => _FieldAnalisisSaringanPlusBodyState();
}

class _FieldAnalisisSaringanPlusBodyState extends State<FieldAnalisisSaringanPlusBody> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: [
              inputFile(label: "1 1/2"),
            ],
          ),
        ],
      ),
    );
  }
}
