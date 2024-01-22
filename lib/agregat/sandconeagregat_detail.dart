// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/soil/sandconetanah_header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class SandconeAgregatDetailFormPage extends StatefulWidget {
  const SandconeAgregatDetailFormPage({super.key});

  @override
  _SandconeAgregatDetailFormPageState createState() => _SandconeAgregatDetailFormPageState();
}

class _SandconeAgregatDetailFormPageState extends State<SandconeAgregatDetailFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sandcone Aggregate Detail',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Type Agregat"),
                              const TwoFieldsWithLabel(
                                label: "Sta.", controller1: null, controller2: null,),
                              inputFile(label: "Side"),
                              inputFile(label: "Layer"),
                              inputFile(label: "Hole Depth", suffixText: "%"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Sampel',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Weight of Wet Soil", suffixText: "gram"),
                              inputFile(label: "Weight ret. no 3/4 field", suffixText: "gram"),
                              inputFile(label: "Weight Pass. no 3/4 field", suffixText: "gram"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Wet Density',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Initial Wt. of sand + Cont.", suffixText: "gram"),
                              inputFile(label: "Residual Wt. of sand + Cont.", suffixText: "gram"),
                              inputFile(label: "Wt. of Used Sand", suffixText: "gram"),
                              inputFile(label: "Wt. sand to fill cone", suffixText: "gram"),
                              inputFile(label: "Wt. sand to fill hole", suffixText: "gram"),
                              inputFile(label: "Unit weight of sand", suffixText: "gram/cc"),
                              inputFile(label: "Volume of Hole", suffixText: "cm3"),
                              inputFile(label: "Density of Wet Soil Field", suffixText: "cm3"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Moisture Content',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Weight Cont. + wet soil", suffixText: "gram"),
                              inputFile(label: "Weight Cont. + dry soil", suffixText: "gram"),
                              inputFile(label: "Wt. of Water", suffixText: "gram"),
                              inputFile(label: "Wt. Cont", suffixText: "gram"),
                              inputFile(label: "Wt. Dry Soil", suffixText: "gram"),
                              inputFile(label: "% Water Content", suffixText: "%"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Compaction',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Density of Dry Soil", suffixText: "gram/cc"),
                              inputFile(label: "Max. Dry density lab", suffixText: "gram/cc"),
                              inputFile(label: "Opt. Water lab", suffixText: "%"),
                              inputFile(label: "Bulk SPGR"),
                              inputFile(label: "% Ret. No 3/4 Field", suffixText: "%"),
                              inputFile(label: "% Pass No 3/4 Field"),
                              inputFile(label: "Max. Dry density Correction", suffixText: "gram/cc"),
                              inputFile(label: "Compaction Obtained", suffixText: "%"),
                              inputFile(label: "Correction", suffixText: "%"),
                              inputFile(label: "Compaction Required", suffixText: "%"),
                            ],
                          ),
                        ),
                      
                        const SizedBox(height: 16.0), // Add some spacing
                        CustomTextButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SandconeHeaderPage(username: loggedInUsername,)));
                              },
                          text: 'Submit',
                        ),
            ]),),),),
    );
  }
}
