// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/beton/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';

class ApprovalMaterialBetonFormPage extends StatefulWidget {
  const ApprovalMaterialBetonFormPage({super.key});

  @override
  _ApprovalMaterialBetonFormPageState createState() =>
      _ApprovalMaterialBetonFormPageState();
}

class _ApprovalMaterialBetonFormPageState
    extends State<ApprovalMaterialBetonFormPage> {
  String? selectedSampelBeton;
  String? selectedKelasBeton;
  String? selectedFcFs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Approval Material Struktur Beton',
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Column(children: <Widget>[
              /**const CustomInfoCard(
                      //dateText: "Some Date",
                      locationText: "Some Location",
                      project: "Pangkalan Binjai",
                    ),**/
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Column(
                  children: <Widget>[
                    inputFile(label: "Batching Plant"),
                    /**DropdownWidget(
                      hintText: 'Pilih Sisi L/R',
                      label: "Sisi",
                      selectedValue: selectedLayer,
                      items: layer,
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedLayer = value;
                        });
                      },
                    ),**/
                    /**DropdownWidget(
                      hintText: 'Pilih Sisi L/R',
                      label: "Sisi",
                      selectedValue: selectedLayer,
                      items: layer,
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedLayer = value;
                        });
                      },
                    ),**/
                    /**DropdownWidget(
                      hintText: 'Pilih Sisi L/R',
                      label: "Sisi",
                      selectedValue: selectedLayer,
                      items: layer,
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedLayer = value;
                        });
                      },
                    ),**/
                    inputFile(
                        label: "Coarse Aggregate Maximum Size",
                        suffixText: "mm"),
                    inputFile(label: "Slump", suffixText: "cm"),
                    inputFile(
                        label: "Water Cement Ratio (WCR)", suffixText: "%"),
                    inputFile(label: "Water", suffixText: "kg/m3"),
                    inputFile(label: "Cement", suffixText: "kg/m3"),
                    inputFile(
                        label: "Fine Aggregate (Sand)", suffixText: "kg/m3"),
                    inputFile(
                        label: "Coarse Aggregate 5 - 25", suffixText: "kg/m3"),
                    inputFile(
                        label: "Additive Retarder Type D",
                        suffixText: "liter/m3"),
                  ],
                ),
              ),
              CustomTitle(
                text: 'Flexsural Strength',
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget>[
                    inputFile(label: "Age 3 days", suffixText: "kg/cm2"),
                    inputFile(label: "Age 7 days", suffixText: "kg/cm2"),
                    inputFile(label: "Age 14 days", suffixText: "kg/cm2"),
                    inputFile(label: "Age 21 days", suffixText: "kg/cm2"),
                    inputFile(label: "Age 28 days", suffixText: "kg/cm2"),
                  ],
                ),
              ),
              const ButtonUpload(),
              const SizedBox(height: 16.0), // Add some spacing
              CustomTextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuBeton()));
                },
                text: 'Submit',
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
