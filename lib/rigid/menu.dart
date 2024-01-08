import 'package:flutter/material.dart';
import 'package:hki_quality/rigid/approval_material_list.dart';
import 'package:hki_quality/rigid/document_list.dart';
import 'package:hki_quality/rigid/pelaksanaan_list.dart';
import 'package:hki_quality/rigid/pengujian_header_list.dart';
import 'package:hki_quality/screens/batchingplant_header.dart';
import 'package:hki_quality/screens/berita_acara_list.dart';
import 'package:hki_quality/widget/appbar_shadow.dart';
import 'package:hki_quality/widget/menu.dart';

class MenuRigid extends StatelessWidget {
  const MenuRigid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBarWithShadow(title: "Pekerjaan Rigid Pavement",),
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
                          title: "Approval Material",
                          icon: "assets/image/materials.png",
                          backgroundColor: const Color.fromARGB(235, 211, 14, 14),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ListApprovalMaterialRigid()));
                            },
                        ),
                        ItemKategori(
                          title: "Berita Acara",
                          icon: "assets/image/beritaacara.png",
                          backgroundColor: const Color.fromARGB(235, 211, 14, 14),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ListBeritaAcara()));
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ListDocument()));
                            },
                        ),
                        ItemKategori(
                          title: "Batching Plant",
                          icon: "assets/image/cone.png",
                          backgroundColor: const Color(0xEB8DC85D),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BatchingplantFormPage()));
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ListPelaksanaan()));
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
                          title: "Pengujian",
                          icon: "assets/image/sandcone.png",
                          backgroundColor: const Color(0xEB8DC85D),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ListPengujianHeader()));
                            },
                        ),],),),
                ],
              ),
        ],
      ),
    );
  }
}