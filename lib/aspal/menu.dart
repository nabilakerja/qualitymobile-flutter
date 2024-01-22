import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/aspal_curah/header.dart';
import 'package:hki_quality/aspal/coredrill/header.dart';
import 'package:hki_quality/aspal/hotmix/hotmix.dart';
import 'package:hki_quality/aspal/jmf/jmf.dart';
import 'package:hki_quality/aspal/papertest/header.dart';
import 'package:hki_quality/screens/berita_acara.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/soil/dcp.dart';
import 'package:hki_quality/aspal/document.dart';
import 'package:hki_quality/aspal/pelaksanaan.dart';
import 'package:hki_quality/widget/appbar_shadow.dart';
import 'package:hki_quality/widget/menu.dart';

class MenuAspal extends StatelessWidget {
  const MenuAspal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBarWithShadow(title: "Pekerjaan Aspal",),
        ),
      body: ListView(
        padding: const EdgeInsets.only(left: 10,top: 15,right: 10),
        children: [
          Column(
            children:[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 5,bottom: 10),
                child: 
                  const Text("Persiapan",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                  Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemKategori(
                          title: "Job Mix Formula",
                          icon: "assets/image/jmf.png",
                          backgroundColor: const Color.fromARGB(235, 211, 14, 14),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const JMFFormPage()));
                            },
                        ),
                        ItemKategori(
                          title: "Berita Acara",
                          icon: "assets/image/beritaacara.png",
                          backgroundColor: const Color.fromARGB(235, 211, 14, 14),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BeritaAcaraFormPage(username: loggedInUsername,)));
                            },),],),),
                  Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemKategori(
                          title: "Kelengkapan Dokumen",
                          icon: "assets/image/documents.png",
                          backgroundColor: const Color(0xEB8DC85D),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DocumentPage()));
                            },
                        ),
                        ItemKategori(
                          title: "Checklist AMP",
                          icon: "assets/image/cone.png",
                          backgroundColor: const Color(0xEB8DC85D),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DCPFormPage(username: loggedInUsername,)));
                            },),],),),
      
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 5,bottom: 10),
                child: 
                  const Text("Pelaksanaan",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                  Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemKategori(
                          title: "Pelaksanaan",
                          icon: "assets/image/implementation.png",
                          backgroundColor: const Color.fromARGB(235, 211, 14, 14),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PelaksanaanPage()));
                            },
                        ),],),),    
                Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 5,bottom: 10),
                child: 
                  const Text("Pengujian",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                  Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemKategori(
                          title: "Hotmix",
                          icon: "assets/image/sandcone.png",
                          backgroundColor: const Color.fromARGB(235, 211, 14, 14),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HotmixFormPage()));
                            },
                        ),
                        ItemKategori(
                          title: "Paper Test",
                          icon: "assets/image/sandcone.png",
                          backgroundColor: const Color.fromARGB(235, 211, 14, 14),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HeaderPapertestFormPage()));
                            },
                        ),
                        ],),
                        ),
                  Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemKategori(
                          title: "Aspal Curah",
                          icon: "assets/image/sandcone.png",
                          backgroundColor: const Color(0xEB8DC85D),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HeaderAspalCurahFormPage()));
                            },
                        ),
                        ItemKategori(
                          title: "Core Drill",
                          icon: "assets/image/sandcone.png",
                          backgroundColor: const Color(0xEB8DC85D),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HeaderCoreDrillFormPage()));
                            },
                        ),
                        ],),
                        ),
                ],
              ),
        ],
      ),
    );
  }
}