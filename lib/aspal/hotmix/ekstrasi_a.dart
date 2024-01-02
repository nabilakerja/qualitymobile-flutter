// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/hotmix/hotmix.dart';
import 'package:hki_quality/aspal/analisis_saringan/field_analisis_saringan.dart';
import 'package:hki_quality/aspal/analisis_saringan/field_analisis_saringan_plus.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';

class EkstrasiAPage extends StatelessWidget {
  final bool shouldShowCombinedGradationPlusBody;
  
  const EkstrasiAPage({
    Key? key,
    this.shouldShowCombinedGradationPlusBody = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ekstrasi A'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CustomTitle(text: "Ukuran Ayakan"),
              ),
              Column(
                children: [
                  if (shouldShowCombinedGradationPlusBody)
                    const FieldAnalisisSaringanPlusBody(),
                  const FieldAnalisisSaringanBody(),
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