// ignore_for_file: use_build_context_synchronously, use_super_parameters, library_private_types_in_public_api, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps, body_might_complete_normally_nullable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

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
  late String formattedDate;
  String? userProject;
  int? preparationId;
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
  double? currentLatitude;
  double? currentLongitude;

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
    formattedDate = getCurrentDate();
    requestLocationPermission();
    userData = fetchUserData(widget.username);
  }

  Future<void> fetchCSRFToken() async {
    await csrfTokenHandler.fetchCSRFToken();
    // Access the csrfToken using csrfTokenHandler.csrfToken
  }

  String getCurrentDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd THH:mm:ss');
    return formatter.format(now);
  }

Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      getCurrentLocation();
    } else {
      // Handle the case where the user denied the permission
      print('Location permission denied');
    }
  }
  
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentLatitude = position.latitude;
        currentLongitude = position.longitude;
      });

      print('Current Location: $currentLatitude, $currentLongitude');
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  Future<Map<String, dynamic>> fetchUserData(String username) async {
  try {
    final response = await http.get(
      Uri.parse('${DjangoConstants.backendBaseUrl}/api/profile/$username/'),
    );
    print('header: $username');
    if (response.statusCode == 200) {
      dynamic responseBody = jsonDecode(response.body);
      print('respon: $responseBody');

      if (responseBody is Map<String, dynamic>) {
        // If the response is a map, handle it as expected
        Map<String, dynamic> user = responseBody;
        setState(() {
          userId = user['id'] as int?;
          userProject = user['project'];  // Set the userProject
        });
        print('User Data Snapshot: $user');  // Log user data snapshot
        return user;
      } else if (responseBody is List<dynamic> && responseBody.isNotEmpty) {
        // If the response is a list, you might need to handle it differently
        // For example, you can return the first item in the list
        Map<String, dynamic> user = responseBody[0];
        setState(() {
          userId = user['user_id'] as int?;
          userProject = user['project'];  // Set the userProject
        });
        print('User Data Snapshot: $user');  // Log user data snapshot
        return user;
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

Future<int?> fetchProject(String userProject) async {
  try {
    final response = await http.get(
      Uri.parse('${DjangoConstants.backendBaseUrl}/api/search/$userProject/'),
    );

    if (response.statusCode == 200) {
      List<dynamic> responseBody = jsonDecode(response.body);

      if (responseBody.isNotEmpty) {
        // Take the first item from the list
        Map<String, dynamic> projectData = responseBody[0];
        int? projectId = projectData['id'] as int?;
        return projectId;
      } else {
        throw Exception('No project data found for: $userProject');
      }
    } else {
      throw Exception('Failed to load project data: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching project data: $error');
    throw Exception('Failed to load project data');
  }
}

  Future<int?> fetchPreparationData() async {
    try {
      await fetchUserData(widget.username); // Fetch user data to get userProject
      int? projectId = await fetchProject(userProject!);

      if (projectId == null || csrfTokenHandler.csrfToken == null) {
        print('Failed to fetch project data or CSRF token not available. Aborting request.');
        return null;
      }

      String formattedDateTime = DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now());

      Map<String, dynamic> preparationData = {
        'work_types_id': 1,
        'project': projectId,
        'activity_id': 2,
        'sub_activities_id': 1,
        'user_id': userId,
        'time_at': formattedDateTime,
        'latitude': '123.456',
        'longitude': '789.012',
      };

      final response = await http.post(
        Uri.parse('${DjangoConstants.backendBaseUrl}/equality/preparations-list/'),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfTokenHandler.csrfToken!,
        },
        body: jsonEncode(preparationData),
      );

      if (response.statusCode == 201) {
        print('Preparation data successfully submitted!');
        print(response.body);
        final preparationId = jsonDecode(response.body)['id'];
        return preparationId;
      } else {
        print('Submit failed. Status code: ${response.statusCode}');
        print('Response body : ${response.body}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }

  Future<void> fetchTanahMaterial(int preparationId) async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token or preparation ID not available. Aborting request.');
      return;
    }

    // Replace these with your Django backend details
    const String baseUrl =
        'http://10.0.2.2:8000'; // Replace with your Django backend base URL
    const String approvalmaterialUrl = '$baseUrl/equality/tanah-material/';
    //String userProject = await getUserProject(loggedInUsername);

    print('print id ini : $preparationId');
    Map<String, dynamic> formData = {
      'preparations_id': preparationId,
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
        print('Response body Approval Material: ${response.body}');
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
              FutureBuilder(
                future: getCurrentLocation(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Location data is available, display it in CustomInfoCard
                    return CustomInfoCard(
                      locationText:
                          'Lat: $currentLatitude, Long: $currentLongitude',
                      username: loggedInUsername,
                    );
                  } else if (snapshot.hasError) {
                    // Handle error
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Location data is not available yet, display a loading indicator
                    return const CircularProgressIndicator();
                  }
                },
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
                hintText: 'Pilih Klasifikasi Tanah',
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
                  suffixText: "gr/cm3",
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
                text: 'Analisis Saringan',
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
              const SizedBox(
                height: 15,
              ),
              CustomTextButton(
                onPressed: () async {
                  await fetchUserData(loggedInUsername);
                  int? preparationsId = await fetchPreparationData();
                  print('ini id preparation berapa : $preparationsId');
                  if (preparationsId != null) {
                    // If preparationsId is not null, proceed with fetchTanahMaterial
                    await fetchTanahMaterial(preparationsId);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ListApprovalMaterialSoil(), // Replace YourNextScreen with the actual widget for the next screen
                      ),
                    );
                  }
                },
                text: 'Kirim',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
