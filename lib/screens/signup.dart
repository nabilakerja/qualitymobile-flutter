// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hki_quality/API/csrf_token.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:http/http.dart' as http;

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  int? userId;
  String? selectedImagePath;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  final TextEditingController positionController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController projectController = TextEditingController();
  final TextEditingController directsupervisorController =
      TextEditingController();
  final TextEditingController ruasController = TextEditingController();
  final TextEditingController seksiController = TextEditingController();

  late CSRFTokenHandler csrfTokenHandler;
  String? csrfToken;

  List<String> _filePaths = [];

  @override
  void initState() {
    super.initState();
    // Fetch CSRF token when the widget is initialized
    csrfTokenHandler = CSRFTokenHandler();
    // Fetch CSRF token when the widget is initialized
    fetchCSRFToken();
  }

  Future<void> fetchCSRFToken() async {
    try {
      await csrfTokenHandler.fetchCSRFToken();
      // Access the csrfToken using csrfTokenHandler.csrfToken
    } catch (e) {
      print('Error fetching CSRF token: $e');
      // Handle the error (e.g., show an error message to the user)
    }
  }

  bool isPasswordValid() {
    return passwordController.text == confirmpasswordController.text;
  }

  Future<void> registerUser() async {
    if (!isPasswordValid()) {
      print('Password and confirmation do not match.');
      // You can provide feedback to the user, e.g., show an error message
      return;
    }
    const String apiUrl = '${DjangoConstants.backendBaseUrl}/api/register/';

    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token is null. Aborting registration.');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfTokenHandler.csrfToken!,
        },
        body: jsonEncode({
          'username': usernameController.text,
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 201) {
        // Registration successful, handle the response accordingly
        print('User registered successfully');
        final Map<String, dynamic> responseData = json.decode(response.body);
        final int userId = responseData['id'] ?? -1;
        final String profilePicturePath = 'path/to/default/image';
        // Create user profile with the obtained user ID
        await createUserProfile(userId, profilePicturePath);
      } else {
        // Registration failed, handle the error
        print('Failed to register user. Error: ${response.body}');
        // Handle the error (e.g., show an error message to the user)
      }
    } catch (e) {
      print('Error during registration: $e');
      // Handle the error (e.g., show an error message to the user)
    }
  }

  Future<void> createUserProfile(int userId, String filePath) async {
    const String apiUrl = '${DjangoConstants.backendBaseUrl}/api/user_profile/';

    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token is null. Aborting registration.');
      return;
    }
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'multipart/form-data',
          'X-CSRFToken': csrfTokenHandler.csrfToken!,
        },
        body: jsonEncode({
          'username': userId,
          'position': positionController.text,
          'company': companyController.text,
          'project': projectController.text,
          'direct_supervisor': directsupervisorController.text,
          'ruas': ruasController.text,
          'seksi': seksiController.text,
          'profile_picture': filePath,
        }),
      );

      if (response.statusCode == 201) {
        // Registration successful, handle the response accordingly
        print('User profile successfully');
      } else {
        // Registration failed, handle the error
        print('Failed to profile user. Error: ${response.body}');
        // Handle the error (e.g., show an error message to the user)
      }
    } catch (e) {
      print('Error during profile: $e');
      // Handle the error (e.g., show an error message to the user)
    }
  }

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
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            //height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    Text(
                      "Hello! Register to get started",
                      style: TextStyle(
                        color: Color.fromARGB(235, 211, 14, 14),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(
                          label: "Username", controller: usernameController),
                      inputFile(
                          label: "Nama Depan", controller: firstNameController),
                      inputFile(
                          label: "Nama Belakang",
                          controller: lastNameController),
                      inputFile(
                          label: "Jabatan", controller: positionController),
                      inputFile(
                          label: "Perusahaan", controller: companyController),
                      inputFile(label: "Proyek", controller: projectController),
                      inputFile(label: "Ruas", controller: ruasController),
                      inputFile(label: "Sisi", controller: seksiController),
                      inputFile(
                          label: "Atasan Langsung",
                          controller: directsupervisorController),
                      inputFile(
                          label: "Alamat Email", controller: emailController),
                      inputFile(
                          label: "Kata Sandi",
                          obscureText: true,
                          controller: passwordController),
                      inputFile(
                        label: "Konfirmasi Kata Sandi",
                        obscureText: true,
                        controller: confirmpasswordController,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          _buildFilePickerButton(),
                          //const SizedBox(height: 5,),
                          _buildSelectedFilesText(),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      registerUser();
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    color: const Color.fromARGB(235, 211, 14, 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Registrasi",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Sudah memiliki akun?"),
                      Text(
                        " Masuk",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
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

  Widget _buildFilePickerButton() {
    return MaterialButton(
      height: 40,
      minWidth: 50,
      onPressed: _pickFile,
      color: const Color.fromARGB(255, 219, 11, 11),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Color.fromARGB(255, 219, 11, 11),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt,
              color: Color.fromARGB(255, 255, 255, 255)),
          SizedBox(
            width: 15,
          ),
          Text(
            "Pilih foto profil",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedFilesText() {
    return Column(
      children: _filePaths.map((filePath) {
        return Text(
          "Selected File: $filePath",
          style: const TextStyle(color: Colors.black),
        );
      }).toList(),
    );
  }

  void _pickFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      if (result.files.length == 1) {
        String filePath = result.files.first.path!;
        setState(() {
          _filePaths = [filePath];
        });
      } else {
        // User picked more than one file
        print("Please select only one image file.");
      }
    } else {
      // User canceled the picker
      print("User canceled file picking");
    }
  } catch (e) {
    print("Error picking file: $e");
  }
}


// we will be creating a widget for text field
Widget inputFile(
    {label, obscureText = false, required TextEditingController controller}) {
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
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
              ),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 78, 78, 78)))),
        ),
      ),
      const SizedBox(
        height: 5,
      )
    ],
  );
}
}