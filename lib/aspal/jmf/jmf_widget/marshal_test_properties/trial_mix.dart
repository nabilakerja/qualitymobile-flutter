import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/jmf/jmf_widget/marshal_test_properties/field_marshal_test_properties.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class TrialMixPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Trial Mix'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
          child: Column(
            children: [
              FieldMarshalTestBody(),
            ],
          ),
        ),
      ),
    );
  }
}