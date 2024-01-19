// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print, unused_local_variable, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/home_screen.dart';
import 'package:http/http.dart' as http;

String loggedInUsername = ''; 
class LoginPage extends StatefulWidget {
  
  const LoginPage({super.key});
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    const String baseUrl = 'http://10.0.2.2:8000'; // Replace with your Django backend base URL
    const String loginUrl = '$baseUrl/api/logins/';
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        body: {
          'username': usernameController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        // Successful login, navigate to home screen
        final Map<String, dynamic> data = json.decode(response.body);
        loggedInUsername = data['user']['username']; // Simpan username
        print('Token: ${data['token']}');
        print('User: $loggedInUsername');
        Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      } else {
        // Handle login failure (show error message, etc.)
        print('Login failed: ${response.body}');
        // You can show a Snackbar or Toast with the error message here
      }
    } catch (error) {
      print('Error during login: $error');
      // Handle network or other errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        "Welcome back! ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 219, 11, 11),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Glad to see you, Again!",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        inputFile(label: "Username", controller: usernameController),
                        inputFile(
                            label: "Password",
                            obscureText: true,
                            controller: passwordController)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(top: 0, left: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          loginUser();
                        },
                        color: const Color.fromARGB(235, 211, 14, 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Belum punya akun?"),
                      Text(
                        " Registrasi",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget inputFile(
      {label, obscureText = false, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78))),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
