import 'package:flutter/material.dart';
import 'package:hki_quality/agregat/cbr_field.dart';
import 'package:hki_quality/agregat/sandconeagregat_header.dart';
import 'package:hki_quality/screens/berita_acara.dart';
import 'package:hki_quality/agregat/approval_material_agregat_a.dart';
import 'package:hki_quality/soil/dcp.dart';
import 'package:hki_quality/agregat/document.dart';
import 'package:hki_quality/agregat/pelaksanaan.dart';

class MenuAgregat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBarWithShadow(),
        ),
      body: Container(
        child: ListView(
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
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ApprovalMaterialAgregatAFormPage()));
                              },
                          ),
                          ItemKategori(
                            title: "Berita Acara",
                            icon: "assets/image/beritaacara.png",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BeritaAcaraFormPage()));
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
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DocumentPage()));
                              },
                          ),],),),

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
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PelaksanaanPage()));
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
                            title: "Sandcone Agregat",
                            icon: "assets/image/sandcone.png",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SandconeHeaderPage()));
                              },
                          ),
                          ItemKategori(
                            title: "Berita Acara",
                            icon: "assets/image/beritaacara.png",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BeritaAcaraFormPage()));
                              },),],),),
                    Padding(
                       padding: const EdgeInsets.only(bottom: 10),
                       child: 
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemKategori(
                            title: "CBR Field",
                            icon: "assets/image/cbr.png",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CBRFieldPage()));
                              },
                          ),],),),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}

class ItemKategori extends StatelessWidget {
  ItemKategori({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
    
  }):super(key: key);

  final String title;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(125, 216, 220, 248),
              borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
            ),
            width: 190,
            height: 60,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, 
              children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFEB1D24),
                        borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
                      ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(icon,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        //color: const Color.fromARGB(255, 255, 0, 0)
                        ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(height: 12.0),
                  ),
                  Container(
                    width: 120,
                    child: Text(title,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 13.0,
                            )),
                  )
            ])],
              ),
          ),
        ],
      ),
    );
  }
}

class AppBarWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AppBar(
        title: const Text('Pekerjaan Agregat'),
      ),
    );
  }
}