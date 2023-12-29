import 'package:flutter/material.dart';
import 'package:hki_quality/rigid/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';

class ApprovalMaterialFormPage extends StatefulWidget {
  @override
  _ApprovalMaterialFormPageState createState() => _ApprovalMaterialFormPageState();
}

class _ApprovalMaterialFormPageState extends State<ApprovalMaterialFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Approval Material Rigid',
        
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
                              inputFile(label: "Batching Plant"),
                              inputFile(label: "Sampel Beton"),
                              inputFile(label: "Kelas Beton"),
                              inputFile(label: "Fs/Fc"),
                              inputFile(label: "Coarse Aggregate Maximum Size", suffixText: "mm"),
                              inputFile(label: "Slump", suffixText: "cm"),
                              inputFile(label: "Water Cement Ratio (WCR)", suffixText: "%"),
                              inputFile(label: "Water", suffixText: "kg/m3"),
                              inputFile(label: "Cement", suffixText: "kg/m3"),
                              inputFile(label: "Fine Aggregate (Sand)", suffixText: "kg/m3"),
                              inputFile(label: "Coarse Aggregate 5 - 25", suffixText: "kg/m3"),
                              inputFile(label: "Additive Retarder Type D", suffixText: "liter/m3"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Flexsural Strength',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Age 3 days", suffixText: "kg/cm2"),
                              inputFile(label: "Age 7 days", suffixText: "kg/cm2"),
                              inputFile(label: "Age 14 days", suffixText: "kg/cm2"),
                              inputFile(label: "Age 21 days", suffixText: "kg/cm2"),
                              inputFile(label: "Age 28 days", suffixText: "kg/cm2"),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuRigid()));
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
