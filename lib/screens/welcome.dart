// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/widget/button_upload.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen
          
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 130),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /**Column(
                children: <Widget>[
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                    
                  )
                  /**
                  SizedBox(
                    height: 20,
                  ),
                  Text("Selamat bekerja, gunakan AKHLAK!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,

                  ),)
                  **/
                ],
              ),**/
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/splash.png")
                  )
                ),
              ),

              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));

                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 219, 11, 11),
                      ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        color: Color.fromARGB(255, 219, 11, 11),
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  const SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ButtonUpload()));

                    },
                    color: const Color.fromARGB(255, 219, 11, 11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Text(
                      "Registrasi",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  )
                ],
              ),
              const Column(
                children: <Widget>[
                  Text(
                    "PT Hutama Karya Infrastruktur",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,

                    ),
                    
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}