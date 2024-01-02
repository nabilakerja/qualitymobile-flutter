import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/hotmix/hotmix.dart';
import 'package:hki_quality/aspal/properties_test.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';

class HarianAPage extends StatelessWidget {
  const HarianAPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Hot Bin A'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CustomTitle(text: "Uraian"),
              ),
              Column(
                children: [
                  const FieldPropertiesTestBody(),
                  CustomTextButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HotmixFormPage()));
                              },
                          text: 'Submit',
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}