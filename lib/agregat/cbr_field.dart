import 'package:flutter/material.dart';
import 'package:hki_quality/agregat/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/input_file.dart';

class CBRFieldPage extends StatefulWidget {
  @override
  _CBRFieldPageState createState() => _CBRFieldPageState();
}

class _CBRFieldPageState extends State<CBRFieldPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'CBR Field Pekerjaan Agregat',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
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
                              inputFile(label: "Sumber Material"),
                              inputFile(label: "Sta. Pengujian"),
                              inputFile(label: "Sisi"),
                              inputFile(label: "Kalibrasi Proving Ring"),
                            ],
                          ),
                        ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 70,
                      child: Text("Time (menit)",
                      textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0,
                                    )),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: 95,
                      child: Text("Penetration (inch)",
                      textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0,
                                    )),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: 95,
                      child: Text("Read of Dial Upper",
                      textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0,
                                    )),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 95,
                      child: Text("Load (Lbs) Upper",
                      textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0,
                                    )),
                    )
                          ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30,right: 45),
                      child: Text("0",)),
                      textField(),textField(),textField(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Text("1/4",)),
                      textField(),textField(),textField(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Text("1/2",)),
                      textField(),textField(),textField(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30,right: 45),
                      child: Text("1",)),
                      textField(),textField(),textField(),
                  ],
                ),
                Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 15),
                          child: 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Upload a file",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                        ),),
                                        Text("Image upload description",
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 12,
                                                ),),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.only(top: 15),
                                                  child: Column(
                                                    children: [
                                                      Image.asset("assets/image/upload.png")
                                                  ]),
                                                )
                              ],
                            ),),
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

Widget textField({obscureText = false})
{
  return Column(
    children: <Widget>[
      Container(
        width: 85,
        height: 60,
        padding: EdgeInsets.only(top: 15),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
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
