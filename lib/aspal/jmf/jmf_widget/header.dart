// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom.dart';

class FieldHeaderBody extends StatefulWidget {
  const FieldHeaderBody({super.key});

  @override
  _FieldHeaderBodyState createState() => _FieldHeaderBodyState();
}

class _FieldHeaderBodyState extends State<FieldHeaderBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            /**const CustomInfoCard(
                      //dateText: "Some Date",
                      locationText: "Some Location",
                      project: "Pangkalan Binjai",
                    ),**/
                      Container(
                        padding: const EdgeInsets.only(top: 15,bottom: 10),
                        child: Column(
                          children: <Widget>[
                            inputFile(label: "Type Asphalt"),
                            inputFile(label: "Work Item"),
                            inputFile(label: "Type Of Material"),
                            inputFile(label: "Sumber Material"),
                          ],
                        ),
                      ),
                      CustomTitle(
                        text: 'Hot Bin',
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15,bottom: 10),
                        child: Column(
                          children: <Widget>[
                            inputFile(label: "Hot Bin IV (Pass 1 1/2” Ret 3/4”)", suffixText: "%"),
                            inputFile(label: "FHot Bin III (Pass 3/4” Ret 3/8”)low", suffixText: "%"),
                            inputFile(label: "Hot Bin II (Pass 3/8” Ret No 4)", suffixText: "%"),
                            inputFile(label: "Hot Bin I (Pass No. 4)", suffixText: "%"),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
