// ignore_for_file: use_build_context_synchronously, use_super_parameters, library_private_types_in_public_api, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hki_quality/API/csrf_token.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/soil/approval_material_list.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:http/http.dart' as http;
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/dropdown.dart';
import 'package:hki_quality/widget/input_file.dart';

class ApprovalMaterialTestFormPage extends StatefulWidget {
  final String username;

  const ApprovalMaterialTestFormPage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  _ApprovalMaterialTestFormPageState createState() =>
      _ApprovalMaterialTestFormPageState();
}

class _ApprovalMaterialTestFormPageState
    extends State<ApprovalMaterialTestFormPage> {
  late CSRFTokenHandler csrfTokenHandler;

  late Future<Map<String, dynamic>> userData;
  String? userProject;
  int? userId;
  String? csrfToken;
  String? selectedKlasifikasiTanah;
  List<dynamic> klasifikasitanah = [
    'AASHTO A-4',
    'AASHTO A-5',
    'AASHTO A-6',
    'AASHTO A-7',
    'AASHTO A-7-5',
  ];

  TextEditingController peruntukanMaterialController = TextEditingController();
  TextEditingController asalMaterialController = TextEditingController();
  TextEditingController kedalamanController = TextEditingController();
  TextEditingController mddController = TextEditingController();
  TextEditingController omcController = TextEditingController();
  TextEditingController liquid_limitController = TextEditingController();
  TextEditingController plastic_limitController = TextEditingController();
  TextEditingController plastic_indexController = TextEditingController();
  TextEditingController specific_gravityController = TextEditingController();
  TextEditingController cbrController = TextEditingController();
  TextEditingController swelling_potentialController = TextEditingController();
  TextEditingController active_valuesController = TextEditingController();
  TextEditingController sa_476Controller = TextEditingController();
  TextEditingController sa_2Controller = TextEditingController();
  TextEditingController sa_042Controller = TextEditingController();
  TextEditingController sa_0149Controller = TextEditingController();
  TextEditingController sa_0074Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch CSRF token when the widget is initialized
    csrfTokenHandler = CSRFTokenHandler();
    // Fetch CSRF token when the widget is initialized
    fetchCSRFToken();
  }

  Future<void> fetchCSRFToken() async {
    await csrfTokenHandler.fetchCSRFToken();
    // Access the csrfToken using csrfTokenHandler.csrfToken
  }

  Future<int?> fetchUserData(String loggedInUsername) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${DjangoConstants.backendBaseUrl}/api/profile/$loggedInUsername/',
        ),
      );
      if (response.statusCode == 200) {
        dynamic responseBody = jsonDecode(response.body);
        print('respon untuk user ini : $responseBody');

        if (responseBody is Map<String, dynamic>) {
          Map<String, dynamic> user = responseBody;
          userProject = user['project'];
          int? userId = user['user_id'] as int?;
          // Other user data handling...
          return userId; // Return the user ID
        } else if (responseBody is List<dynamic> && responseBody.isNotEmpty) {
          Map<String, dynamic> user = responseBody[0];
          userProject = user['project'];
          int? userId = user['user_id'] as int?;
          // Other user data handling...
          return userId; // Return the user ID
        } else {
          throw Exception('Invalid response format: $responseBody');
        }
      } else {
        throw Exception('Failed to load user data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching user data: $error');
      throw Exception('Failed to load user data');
    }
  }

  Future<void> fetchPreparationData() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return;
    }

    try {
      const String baseUrl = 'http://10.0.2.2:8000';
      const String preparationsUrl = '$baseUrl/equality/preparations-list/';

      Map<String, dynamic> preparationData = {
        'work_types_id': 1,
        'project': 2,
        'activity_id': 2,
        'sub_activities_id': 1,
        'user_id': 1,
        'time_at': '2024-01-19',
        'latitude': '123.456',
        'longitude': '789.012',
      };

      final response = await http.post(
        Uri.parse(preparationsUrl),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfTokenHandler.csrfToken!,
        },
        body: jsonEncode(preparationData),
      );

      if (response.statusCode == 201) {
        print('Preparation data successfully submitted!');
        print('Response body: ${preparationData}');
      } else {
        print('Submit failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> fetchTanahMaterial() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return;
    }

    // Replace these with your Django backend details
    const String baseUrl =
        'http://10.0.2.2:8000'; // Replace with your Django backend base URL
    const String approvalmaterialUrl = '$baseUrl/equality/tanah-material/';
    //String userProject = await getUserProject(loggedInUsername);

    Map<String, dynamic> formData = {
      //'project': userProject,
      'peruntukan_material': peruntukanMaterialController.text,
      'asal_material': asalMaterialController.text,
      'klasifikasi_tanah': selectedKlasifikasiTanah,
      'kedalaman': double.tryParse(kedalamanController.text) ?? 0.0,
      'mdd': double.tryParse(mddController.text) ?? 0.0,
      'omc': double.tryParse(omcController.text) ?? 0.0,
      'liquid_limit': double.tryParse(liquid_limitController.text) ?? 0.0,
      'plastic_limit': double.tryParse(plastic_limitController.text) ?? 0.0,
      'plastic_index': double.tryParse(plastic_indexController.text) ?? 0.0,
      'specific_gravity':
          double.tryParse(specific_gravityController.text) ?? 0.0,
      'cbr': double.tryParse(cbrController.text) ?? 0.0,
      'swelling_potential':
          double.tryParse(swelling_potentialController.text) ?? 0.0,
      'active_values': double.tryParse(active_valuesController.text) ?? 0.0,
      'sa_476': double.tryParse(sa_476Controller.text) ?? 0.0,
      'sa_2': double.tryParse(sa_2Controller.text) ?? 0.0,
      'sa_042': double.tryParse(sa_042Controller.text) ?? 0.0,
      'sa_0149': double.tryParse(sa_0149Controller.text) ?? 0.0,
      'sa_0074': double.tryParse(sa_0074Controller.text) ?? 0.0,
    };

    try {
      final response = await http.post(
        Uri.parse(approvalmaterialUrl),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfTokenHandler.csrfToken!,
        },
        body: jsonEncode(formData),
      );

      if (response.statusCode == 201) {
        // Successful submission, navigate to the desired page
        //Navigator.pushReplacementNamed(context, '/list_approval_material_soil');
        print(formData);
      } else {
        // Print error details for debugging
        print('Submit failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // You can show an error message to the user or handle it accordingly
      }
    } catch (error) {
      // Print the exception for debugging
      print('Error during Submit: $error');
      // You can show an error message to the user or handle it accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Persetujuan Bahan Pekerjaan Tanah',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              CustomInfoCard(
                locationText: "Some Location",
                username: loggedInUsername,
              ),
              const SizedBox(
                height: 15,
              ),
              inputFile(
                  label: "Peruntukan Material",
                  controller: peruntukanMaterialController),
              inputFile(
                  label: "Asal Material", controller: asalMaterialController),
              inputFile(
                  label: "Kedalaman",
                  suffixText: "meter",
                  controller: kedalamanController),
              DropdownWidget(
                hintText: 'Select Klasifikasi Tanah',
                label: "Klasifikasi Tanah",
                selectedValue: selectedKlasifikasiTanah,
                items: klasifikasitanah,
                onChanged: (dynamic value) {
                  setState(() {
                    selectedKlasifikasiTanah = value;
                  });
                },
              ),
              inputFile(
                  label: "Max Dry Density (MDD)",
                  suffixText: "gram",
                  controller: mddController),
              inputFile(
                  label: "Optimum Moisture Content (OMC)",
                  suffixText: "%",
                  controller: omcController),
              inputFile(
                  label: "Liquid Limit",
                  suffixText: "%",
                  controller: liquid_limitController),
              inputFile(
                  label: "Plastic Limit",
                  suffixText: "%",
                  controller: plastic_limitController),
              inputFile(
                  label: "Plastic Index",
                  suffixText: "%",
                  controller: plastic_indexController),
              inputFile(
                  label: "Specific Gravity",
                  suffixText: "gr/cm3",
                  controller: specific_gravityController),
              inputFile(
                  label: "CBR at 100% MDD after 4 days soaked",
                  suffixText: "%",
                  controller: cbrController),
              inputFile(
                  label: "Swelling Potensial",
                  suffixText: "%",
                  controller: swelling_potentialController),
              inputFile(
                  label: "Nilai Aktif",
                  suffixText: "%",
                  controller: active_valuesController),
              const SizedBox(
                height: 10,
              ),
              CustomTitle(
                text: 'Sieve Analysis (Passed)',
              ),
              const SizedBox(
                height: 10,
              ),
              inputFile(
                  label: "4,76 mm | 4 inch",
                  suffixText: "%",
                  controller: sa_476Controller),
              inputFile(
                  label: "2,00 mm | 10 inch",
                  suffixText: "%",
                  controller: sa_2Controller),
              inputFile(
                  label: "0,42 mm | 40 inch",
                  suffixText: "%",
                  controller: sa_042Controller),
              inputFile(
                  label: "0,149 mm | 100 inch",
                  suffixText: "%",
                  controller: sa_0149Controller),
              inputFile(
                  label: "0,074 mm | 200 inch",
                  suffixText: "%",
                  controller: sa_0074Controller),
              const SizedBox(
                height: 10,
              ),
              const ButtonUpload(),
              CustomTextButton(
                onPressed: () async {
                  await fetchPreparationData();
                  await fetchTanahMaterial();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ListApprovalMaterialSoil(), // Replace YourNextScreen with the actual widget for the next screen
                    ),
                  );
                },
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
