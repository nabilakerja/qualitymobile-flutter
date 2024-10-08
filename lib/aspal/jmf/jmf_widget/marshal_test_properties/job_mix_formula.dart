import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/jmf/jmf_widget/marshal_test_properties/field_marshal_test_properties.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class JMFPage extends StatelessWidget {
  const JMFPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Job Mix Formula'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
          child: const Column(
            children: [
              FieldMarshalTestBody(),
            ],
          ),
        ),
      ),
    );
  }
}