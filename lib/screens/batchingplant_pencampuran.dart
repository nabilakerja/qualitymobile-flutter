// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hki_quality/rigid/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/dropdown_kondisi.dart';
import 'package:hki_quality/widget/title_custom.dart';

class BatchingPlantPencampuran extends StatelessWidget {
  String? selectedBin;

  BatchingPlantPencampuran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Komponen Pencampuran',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
          child: Column(children: <Widget> [
            CustomTitle(
              text: "Pan Mixer"),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pan",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Lengan Pengaduk / Paddle",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Paddle Tips",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Poros Pengaduk",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Motor Pemutar",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pintu Pengeluaran",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Silinder Pembuka Pintu",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pipa-pipa / Selang",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Kompressor",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Corong Penyalur",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roda Gigi / Gear Pemutar ",
              ),
            const SizedBox(height: 15,),
            CustomTitle(
              text: "Plugmill"),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Poros Pengaduk",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Lengan-lengan Pengaduk",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Piringan Pengaduk / Paddle Tip",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Silinder / Plugmill / Bucket",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roda Gigi Pemutar",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Motor Pemutar",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Rantai / Van Belt",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pintu Pembuangan",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Silinder (Tuas) Pintu Pembuangan",
              ),
            const SizedBox(height: 15,),
            CustomTitle(
              text: "Free Fall Mixer"),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Silinder / Drum",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Sudu-sudu Keong",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Motor Pemutar Hidrolik",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Poros / Bantalan Atas",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Mekanisme Pemutar Drum",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roll Penyangga Drum",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Tangki Air",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Tangki Hidrolik",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Pompa Hidrolik",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Corong Pengisian",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Corong Pengeluaran",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Truck Unit ",
              ),
            const SizedBox(height: 15,),
            CustomTitle(
              text: "Reversible Mixer"),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Drum",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Skip Loader / Hopper",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Sling Pengangkat",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roda",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Mesin Pemutar",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roda Gigi",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Konstruksi Mixer",
              ),
            const SizedBox(height: 15.0),
            CustomTitle(
              text: "Pencampur Angkat"),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Drum",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roda Gigi Pemutar",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roda Pemutar",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Mesin Pemutar",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Dudukan Kereta",
              ),
            DropdownIconKondisiBerfungsiWidget(
              onChanged: (value) {
                // Handle the changed value
              },
              hintText: "Select an option",
              label: "Roda",
              ),
            const SizedBox(height: 15,),
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