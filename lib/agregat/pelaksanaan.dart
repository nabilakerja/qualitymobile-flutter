import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/cont_slider2.dart';
import 'package:hki_quality/agregat/menu.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class PelaksanaanPage extends StatefulWidget {
  @override
  _PelaksanaanPageState createState() => _PelaksanaanPageState();
}

class _PelaksanaanPageState extends State<PelaksanaanPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pelaksanaan Pekerjaan Agregat',
        
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
                              TwoFieldsWithLabel(
                                label: "Sta.",),
                            ],
                          ),
                        ),
                CustomContainerSlider2(
                          text: 'Pencampuran, penghamparan, dan pemadatan secara merata dengan kadar air dalam rentang 3% dibawah kadar air optimum sampai 1% diatas kadar air optimum',
                        ),
                CustomContainerSlider2(
                          text: 'Agregat dihampar dengan tebal yang sama dan tidak terjadi segregasi.',
                        ),
                CustomContainerSlider2(
                          text: 'Tebal padat maksimum tidak lebih dari 20 cm dan kepadatan minimal 100% dari kepadatan kering maksimum.',
                        ),
                CustomContainerSlider2(
                          text: 'Pemadatan Lapis Drainase dilaksanakan minimum 6 lintasan dengan vibratory roller sekitar 10 ton.',
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuAgregat()));
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
