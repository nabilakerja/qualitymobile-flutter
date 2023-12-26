import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/cont_slider.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/screens/kalibrasi.dart';
import 'package:hki_quality/agregat/menu.dart';
import 'package:hki_quality/widget/title_custom_button.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Kelengkapan Dokumen Persiapan',
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
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
                          padding: EdgeInsets.only(left: 10),
                          child: 
                            Text(
                              "formatDate()",
                              ),),],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Location()"),
                      Container(
                        padding: EdgeInsets.only(left: 10),
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
                    color: Color(0x7CFFE0E0),
                    borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
                    border: Border.all(
                      color: Color(0x79F61118),
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
                          decoration: BoxDecoration(
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
                          padding: EdgeInsets.all(10),
                          child: Image.asset("assets/image/building.png",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                              //color: const Color.fromARGB(255, 255, 0, 0)
                              ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: SizedBox(height: 12.0),
                        ),
                        Text("Pangkalan Binjai",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                                ))
                  ])],
                    ),
                      ),),
              Container(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Column(
                          children: <Widget>[
                            inputFile(label: "Type Agregat"),
                            inputFile(label: "Sumber Material"),
                            inputFile(label: "Sta. Persiapan"),
                          ],
                        ),
                      ),
              CustomTitle(
                        text: 'Work Permit Application',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: CustomTitle(
                          text: 'Work Permit Application',
                        ),
              ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: CustomTitle(
                          text: 'Work Permit Application',
                        ),
              ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              CustomContainerSlider(
                        text: 'Shop Drawing',
                      ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: CustomTitleButton(
                  title: 'Kalibrasi',
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Kalibrasi()));
                              },
                ),
              ),
              SizedBox(height: 16.0), // Add some spacing
              CustomTextButton(
                onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuAgregat()));
                              },
                text: 'Submit',
                ),
          ]),),),
    );
  }

Widget inputFile({label, obscureText = false, suffixText})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical:2),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
              suffixText: suffixText,
              contentPadding: EdgeInsets.symmetric(vertical: 0,
                  horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 78, 78, 78)
                ),
        
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color.fromARGB(255, 78, 78, 78))
              )
          ),
        ),
      ),
      SizedBox(height: 5,)
    ],
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
