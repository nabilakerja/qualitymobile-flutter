import 'package:flutter/material.dart';
import 'package:hki_quality/screens/home_page.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
        ),
      
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            //height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Hello! Register to get started",
                    style: TextStyle(
                      color: Color.fromARGB(235, 211, 14, 14),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Nama Lengkap"),
                      inputFile(label: "Jabatan"),
                      inputFile(label: "Perusahaan"),
                      inputFile(label: "Proyek"),
                      inputFile(label: "Ruas"),
                      inputFile(label: "Sisi"),
                      inputFile(label: "Atasan Langsung"),
                      inputFile(label: "Email"),
                      inputFile(label: "Password", obscureText: true),
                      inputFile(label: "Confirm Password ", obscureText: true),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 0, left: 0),
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),   
                      )
        
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));      
                      },
                    color: Color.fromARGB(235, 211, 14, 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), 
                    ),
                    child: Text(
                      "Registrasi", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,     
                    ),
                    ),       
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Sudah memiliki akun?"),
                      Text(" Masuk", style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ),
                      )
                    ],
                  ),
                )
              ],
            ),       
          ),
        ),
      ),
    );
  }
}



// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
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
        padding: EdgeInsets.symmetric(vertical: 10),
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
