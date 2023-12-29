import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/cont_slider2.dart';
import 'package:hki_quality/soil/menu.dart';
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
        title: 'Pelaksanaan Pekerjaan Tanah',
        
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
                          text: 'Lapisan material sebelum dipadatkan tidak lebih dari 20 cm, kecuali alat dapat memadatkan lebih dari 20 cm dengan kepadatan seragam.',
                        ),
                CustomContainerSlider2(
                          text: 'Ketebalan gembur lapisan tidak melebihi 10 cm, dipadatkan dengan mechanical hammers.',
                        ),
                CustomContainerSlider2(
                          text: 'Dipadatkan arah memanjang dan melintang.',
                        ),
                CustomContainerSlider2(
                          text: 'Area tepi / lereng, dilebihkan ±50 cm, dipadatkan kemudian di-cutting dengan bucket excavator.',
                        ),
                CustomContainerSlider2(
                          text: 'Permukaan rata / tidak bergelombang.',
                        ),
                CustomContainerSlider2(
                          text: 'Kemiringan lereng / sloope sesuai desain.',
                        ),
                CustomContainerSlider2(
                          text: 'Lainnya',
                        ),
                CustomContainerSlider2(
                          text: 'Keadaan Eksisting (Progress 0%)',
                        ),
                CustomContainerSlider2(
                          text: 'Proses Penghamparan dan Pemadatan (Progress 50%)',
                        ),
                CustomContainerSlider2(
                          text: 'Keadaan Setelah Penghamparan dan Pemadatan (Progress 100%)',
                        ),
                SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuSoil()));
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
