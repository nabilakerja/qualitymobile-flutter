import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/widget/input_file.dart';

class ApprovalMaterialAgregatBFormPage extends StatefulWidget {
  @override
  _ApprovalMaterialAgregatBFormPageState createState() => _ApprovalMaterialAgregatBFormPageState();
}

class _ApprovalMaterialAgregatBFormPageState extends State<ApprovalMaterialAgregatBFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Approval Material Agregat B',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Row(
                      children:  <Widget>[
                        Image.asset('assets/image/calendar.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: 
                              const Text(
                                "formatDate()",
                                ),),                           
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          "Location()"),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/image/location.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,),
                        ),               
                      ],),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x7CFFE0E0),
                      borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
                      border: Border.all(
                        color: const Color(0x79F61118),
                        width: 2.0,
                      ),
                    ),
                    //padding: EdgeInsets.only(top: 10, bottom: 10),
                    height: 54,
                    width: 400,
                    //color: Color.fromRGBO(2, 9, 56, 0.498),
                    //color: selectedFood == foodName
                      // ? Color.fromARGB(255, 66, 212, 100)
                        //: Colors.transparent,
                    child:
                      Column(mainAxisAlignment: MainAxisAlignment.start, 
                      children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors:[Color(0xFFFF0000),Color.fromARGB(255, 0, 0, 0)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3.0),
                                  topRight: Radius.circular(0.0),
                                  bottomLeft: Radius.circular(3.0),
                                  bottomRight: Radius.circular(0.0),),
                              ),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/image/building.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                                //color: const Color.fromARGB(255, 255, 0, 0)
                                ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: SizedBox(height: 12.0),
                          ),
                          const Text("Pangkalan Binjai",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14.0,
                                  ))
                    ])],
                      ),
                        ),
                ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Tipe Agregat"),
                              inputFile(label: "Sumber Material"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Compaction Experiment',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Yd Maksimum (MDD)"),
                              inputFile(label: "95% Yd Maksimum (MDD)", suffixText: "%"),
                              inputFile(label: "W Optimum (OMC)", suffixText: "%"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitle(
                            text: 'Atterberg Limit',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Liquid Limit", suffixText: "%"),
                              inputFile(label: "Plastic Limit", suffixText: "%"),
                              inputFile(label: "Plastic Index", suffixText: "%"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitle(
                            text: 'CBR Laboratorium',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "CBR Laboratorium (100%)", suffixText: "%"),
                              inputFile(label: "Keausan Agregat", suffixText: "%"),
                              inputFile(label: "Gravitasi Spesifik", suffixText: "%"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitle(
                            text: 'Proporsi Campuran Agregat B',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Split 3-5", suffixText: "%"),
                              inputFile(label: "Split 2-3", suffixText: "%"),
                              inputFile(label: "Split 1-2", suffixText: "%"),
                              inputFile(label: "Split 1-1", suffixText: "%"),
                              inputFile(label: "Abu Batu", suffixText: "%"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitle(
                            text: 'Sieve Analysis',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "2”", suffixText: "%"),
                              inputFile(label: "1,5”", suffixText: "%"),
                              inputFile(label: "1”", suffixText: "%"),
                              inputFile(label: "3/8”", suffixText: "%"),
                              inputFile(label: "No.4", suffixText: "%"),
                              inputFile(label: "No.10", suffixText: "%"),
                              inputFile(label: "No.40", suffixText: "%"),
                              inputFile(label: "No.200", suffixText: "%"),
                            ],
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
