// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/hotmix/ekstrasi_a.dart';
import 'package:hki_quality/aspal/hotmix/harian_a.dart';
import 'package:hki_quality/aspal/hotmix/hotbin_a.dart';
import 'package:hki_quality/aspal/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom_button.dart';

class HotmixFormPage extends StatefulWidget {
  const HotmixFormPage({super.key});

  @override
  _HotmixFormPageState createState() => _HotmixFormPageState();
}

class _HotmixFormPageState extends State<HotmixFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pengujian Hotmix',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                const CustomInfoCard(
                      dateText: "Some Date",
                      locationText: "Some Location",
                      text: "Pangkalan Binjai",
                    ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Type Asphalt"),
                              inputFile(label: "Lokasi AMP"),
                              inputFile(label: "Lokasi Sta."),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Combined Gradation',
                        ),
                        Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: 
                        CustomTitleButton(
                          title: 'Hot Bin A',
                          onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HotBinAPage()));
                                      },
                          ),
                        ),
                        Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: 
                        CustomTitleButton(
                          title: 'Ekstrasi A',
                          onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EkstrasiAPage()));
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
                          title: 'Harian A',
                          onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HarianAPage()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuAspal()));
                              },
                          text: 'Submit',
                        ),
            ]),),),),
    );
  }
}
