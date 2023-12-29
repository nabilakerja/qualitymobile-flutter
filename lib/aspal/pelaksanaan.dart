import 'package:flutter/material.dart';
import 'package:hki_quality/beton/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/cont_slider2.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';

class PelaksanaanPage extends StatefulWidget {
  @override
  _PelaksanaanPageState createState() => _PelaksanaanPageState();
}

class _PelaksanaanPageState extends State<PelaksanaanPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pelaksanaan Pekerjaan Aspal',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                const CustomInfoCard(
                      dateText: "Some Date",
                      locationText: "Some Location",
                      text: "Pangkalan Binjai",
                    ),
                Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Pekerjaan"),
                              inputFile(label: "Sta. Pelaksanaan"),
                            ],
                          ),
                        ),
                CustomContainerSlider2(
                          text: 'Lapis Resap Pengikat diaplikasikan diatas permukaan LPA, Distributor aspal digunakan untuk menyemprot lapisan ini dengan merata keseluruh permukaan. Prime coat : 0,4 s/d 1,3 kg/m2. Tack coat : 0,15 s/d 0,50 kg/m2 ',
                        ),
                CustomContainerSlider2(
                          text: 'Campuran harus dihamparkan pada permukaan yang telah disetujui dan diratakan serta ditempa sesuai dengan kelandaian dan elevasi yang ditentukan.',
                        ),
                CustomContainerSlider2(
                          text: 'Untuk menghamparkan campuran, harus digunakan paver, baik pada seluruh lebar atau sebagian lebar jalan yang masih memungkinkan.',
                        ),
                CustomContainerSlider2(
                          text: 'Suhu campuran aspal saat dimasukkan ke alat penghamparan minimum 130ºC dan saat digilas pertama kali (initial rolling) suhu minimum 125ºC.',
                        ),
                CustomContainerSlider2(
                          text: 'Setelah campuran aspal dihamparkan, ditempa, dan permukaan yang tidak rata diperbaiki, maka harus dipadatkan secara merata dengan digilas.',
                        ),
                CustomContainerSlider2(
                          text: 'Spesific gravity sesuai dengan ketentuan SNI 03-6757-2002 (AASHTO T166-13), tidak boleh kurang dari 98% kepadatan Standar Kerja (Job Standard Density).',
                        ),
                CustomContainerSlider2(
                          text: 'Penggilasan campuran harus terdiri dari tiga operasi pelaksanaan yang terpisah sebagai berikut: Penggilasan Awas (Break Down), Penggilasan Sekunder (Intermediate), Penggilasan Akhir (Finishing).',
                        ),
                CustomContainerSlider2(
                          text: 'Setiap gilasan roller harus overlapping (tumpeng tindih) dengan gilasan terdahulu sebesar setengah lebar roller.',
                        ),
                CustomContainerSlider2(
                          text: 'Roller harus bergerak lambat dan dalam kecepatan tetap dengan roda penggerak berada di depan (ke arah jalannya pekerjaan penghamparan).',
                        ),
                CustomContainerSlider2(
                          text: 'Penggilasan harus berlanjut sampai semua bekas jejak roda mesin gilas dan ketidakrataan lainnya dihilangkan dan untuk memperoleh pemadatan yang seragam sementara.',
                        ),                                
                SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuBeton()));
                              },
                  text: 'Submit',
                  ),
            ]),),),),
    );
  }

  /**void _submitForm() {
    // Implement the form submission logic here
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Add your logic for handling the form data (e.g., API call, database storage, etc.)

    // Reset the form after submission
    _formKey.currentState!.reset();
  }**/
}
