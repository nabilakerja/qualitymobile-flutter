// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hki_quality/rigid/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/dropdown_kondisi.dart';
import 'package:hki_quality/widget/title_custom.dart';

class BatchingPlantPenimbangan extends StatelessWidget {
  String? selectedBin;

  BatchingPlantPenimbangan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Komponen Penimbangan',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
          child: Column(children: <Widget> [
            CustomTitle(
              text: "Agregat"),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Skala Timbangan",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pengatur Otomatis Timbangan",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pintu-pintu Bukaan ",
              ),
            const SizedBox(height: 15,),
            CustomTitle(
              text: "Semen"),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Skala Timbangan",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pintu Bukaan",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pengatur Otomatis Timbangan",
              ),
            const SizedBox(height: 15,),
            CustomTitle(
              text: "Air"),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Skala Timbangan",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Keran Penyalur Pengisian",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pengatur Otomatis Timbangan",
              ),
            const SizedBox(height: 15,),
            CustomTitle(
              text: "Additive"),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Skala Timbangan",
              ),
            const SizedBox(height: 15.0), // Add some spacing
            CustomTextButton(
                onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuRigid()));
                            },
                text: 'Submit',
                ),
          ]),
        ),
      ),
    );
  }
}