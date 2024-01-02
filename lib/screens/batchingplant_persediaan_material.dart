// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hki_quality/rigid/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/dropdown_icon.dart';
import 'package:hki_quality/widget/dropdown_kondisi.dart';
import 'package:hki_quality/widget/title_custom.dart';

class BatchingPlantPersediaanMaterial extends StatelessWidget {
  String? selectedBin;

  BatchingPlantPersediaanMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Komponen Persediaan Material',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
          child: Column(children: <Widget> [
            CustomTitle(
              text: "Agregat"),
            DropdownIconWidget(
              selectedValue: selectedBin,
              items: const [
                "Kondisi baik dan material tidak bercampur", 
                "Kondisi tidak baik dan material bercampur"
                ],
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Bin",
            ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pintu Pengeluaran Agregat",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roll Pemutar",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Motor Pemutar",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Van Belt Pemutar",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roll Penyangga Van Belt Conveyor ",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Belt Conveyor Pemasok Ke Timbangan",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Konstruksi Penyangga Conveyor Pemasok",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roll Conveyor Pemasok",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Motor Pemutar",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Dinding Pemisah",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Sekop Pengangkat",
              ),
            const SizedBox(height: 15,),
            CustomTitle(
              text: "Semen"),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Silo",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pipa Penyalur Pengisian",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Silinder Pengisian",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Kompressor Pengisian",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pipa Penyalur Penimbangan",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Motor Penggerak Penyalur",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Indikator Volume Silo",
              ),
            const SizedBox(height: 15,),
            CustomTitle(
              text: "Air"),
            DropdownIconWidget(
              selectedValue: selectedBin,
              items: const [
                "Kondisi baik dan bersih", 
                "Kondisi tidak baik dan tidak bersih"
                ],
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Tangki air",
            ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Keran Penyalur Pengisian",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pipa Penyalur",
              ),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pipa Pengisian",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Indikator Volume Isi",
              ),
            const SizedBox(height: 15,),
            CustomTitle(
              text: "Additive"),
            DropdownIconKondisiBaikWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Kondisi Bin",
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