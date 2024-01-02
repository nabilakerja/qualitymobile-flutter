// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/jmf/jmf_widget/combined_gradation/combined_gradation.dart';
import 'package:hki_quality/aspal/jmf/jmf_widget/combined_gradation/extraction_gradation_trial_amp.dart';
import 'package:hki_quality/aspal/jmf/jmf_widget/combined_gradation/extraction_gradation_trial_compaction.dart';
import 'package:hki_quality/aspal/jmf/jmf_widget/header.dart';
import 'package:hki_quality/aspal/jmf/jmf_widget/marshal_test_properties/job_mix_formula.dart';
import 'package:hki_quality/aspal/jmf/jmf_widget/marshal_test_properties/trial_compact.dart';
import 'package:hki_quality/aspal/jmf/jmf_widget/marshal_test_properties/trial_mix.dart';
import 'package:hki_quality/beton/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/title_custom_button.dart';

class JMFFormPage extends StatefulWidget {
  const JMFFormPage({super.key});

  @override
  _JMFFormPageState createState() => _JMFFormPageState();
}

class _JMFFormPageState extends State<JMFFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Job Mix Formula Asphalt',
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
          child: Column(
            children: <Widget>[
                      const FieldHeaderBody(),
                      CustomTitle(
                        text: 'Combined Gradation',
                      ),
                      Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: 
                      CustomTitleButton(
                        title: 'Combined Gradation',
                        onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CombinedGradationPage()));
                                    },
                        ),
                      ),
                      Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: 
                      CustomTitleButton(
                        title: 'Extraction Gradation Trial AMP',
                        onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ExtractionGradationAMPPage()));
                                    },
                        ),
                      ),
                      Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: 
                      CustomTitleButton(
                        title: 'Extraction Gradation Trial Compaction',
                        onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ExtractionGradationCompactionPage()));
                                    },
                        ),
                      ),
                      CustomTitle(
                        text: 'Marshal Test Properties',
                      ),
                      Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: 
                      CustomTitleButton(
                        title: 'Job Mix Formula',
                        onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const JMFPage()));
                                    },
                        ),
                      ),
                      Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: 
                      CustomTitleButton(
                        title: 'Trial Mix',
                        onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TrialCompactPage()));
                                    },
                        ),
                      ),
                      Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: 
                      CustomTitleButton(
                        title: 'Trial Compact',
                        onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TrialMixPage()));
                                    },
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 15),
                        child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Upload a file",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                      ),),
                                      const Text("Image upload description",
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 12,
                                              ),),
                                              Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.only(top: 15),
                                                child: Column(
                                                  children: [
                                                    Image.asset("assets/image/upload.png")
                                                ]),
                                              )
                            ],
                          ),),
                      const SizedBox(height: 16.0), // Add some spacing
                      CustomTextButton(
                        onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuBeton()));
                            },
                        text: 'Submit',
                      ),
          ]),),),
    );
  }
}
