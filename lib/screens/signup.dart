import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:http/http.dart' as http;


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _projectController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _sideController = TextEditingController();
  final TextEditingController _supervisorController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _register() async {
    String fullName = _fullNameController.text;
    String jobTitle = _jobTitleController.text;
    String company = _companyController.text;
    String project = _projectController.text;
    String section = _sectionController.text;
    String side = _sideController.text;
    String supervisor = _supervisorController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    final response = await http.post(
      Uri.parse('${DjangoConstants.backendBaseUrl}/api/register/'),
      body: {
        'fullName': fullName,
        'position': jobTitle,
        'company': company,
        'project': project,
        'ruas': section,
        'seksi': side,
        'direct_supervisor': supervisor,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      },
    );

    if (response.statusCode == 200) {
      // Registration successful, handle the result
      print('Registration successful: ${response.body}');
      // Navigate to the next screen or perform other actions
    } else {
      // Registration failed, handle the error
      print('Registration failed: ${response.statusCode}');
      // Show an error message or handle accordingly
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
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
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
                    Text("Hello! Register to get started",
                    style: TextStyle(
                      color: Color.fromARGB(235, 211, 14, 14),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: <Widget>[
                    inputFile(label: "Nama Lengkap", controller: _fullNameController),
                    inputFile(label: "Jabatan", controller: _jobTitleController),
                    inputFile(label: "Perusahaan", controller: _companyController),
                    inputFile(label: "Proyek", controller: _projectController),
                    inputFile(label: "Ruas", controller: _sectionController),
                    inputFile(label: "Sisi", controller: _sideController),
                    inputFile(label: "Atasan Langsung", controller: _supervisorController),
                    inputFile(label: "Email", controller: _emailController),
                    inputFile(label: "Password", obscureText: true, controller: _passwordController),
                    inputFile(
                      label: "Confirm Password",
                      obscureText: true,
                      controller: _confirmPasswordController,
                    ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),   
                      )
        
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () 
                    {
                      _register();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));      
                      },
                    color: const Color.fromARGB(235, 211, 14, 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), 
                    ),
                    child: const Text(
                      "Registrasi", style: TextStyle(
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
Widget inputFile({label, obscureText = false,required TextEditingController controller})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

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
              contentPadding: EdgeInsets.symmetric(vertical: 0,
                  horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 78, 78, 78)
                ),
        
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78))
              )
          ),
        ),
      ),
      const SizedBox(height: 5,)
    ],
  );
}
