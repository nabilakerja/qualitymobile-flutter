// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:hki_quality/API/csrf_token.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/soil/sandconetanah_header_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/soil/sandconetanah_detail_list.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/title_custom_button.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';
import 'package:intl/intl.dart';


class SandconeHeaderPage extends StatefulWidget {
  final String username;

  const SandconeHeaderPage({
    super.key,
    required this.username,
  });

  @override
  _SandconeHeaderPageState createState() => _SandconeHeaderPageState();
}

class _SandconeHeaderPageState extends State<SandconeHeaderPage> {

  TextEditingController staController1 = TextEditingController();
  TextEditingController staController2 = TextEditingController();
  final TextEditingController sourceMaterialController = TextEditingController();
  final TextEditingController mddsController = TextEditingController();
  final TextEditingController omcsController = TextEditingController();


  late CSRFTokenHandler csrfTokenHandler;
  late Future<Map<String, dynamic>> userData;
  late String formattedDate;
  String? userProject;
  int? testingId;
  int? userId;
  String? csrfToken;

  List<DataRow> dataRows = [];

  @override
  void initState() {
    super.initState();
    csrfTokenHandler = CSRFTokenHandler();
    // Fetch CSRF token when the widget is initialized
    fetchCSRFToken();
    userData = fetchUserData(widget.username);
  }

  Future<void> fetchCSRFToken() async {
    await csrfTokenHandler.fetchCSRFToken();
    // Now that CSRF token is available, you can proceed with other operations
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
            userProject = user['project']; // Set the userProject
          });
          print('User Data Snapshot: $user'); // Log user data snapshot
          return user;
        } else if (responseBody is List<dynamic> && responseBody.isNotEmpty) {
          // If the response is a list, you might need to handle it differently
          // For example, you can return the first item in the list
          Map<String, dynamic> user = responseBody[0];
          setState(() {
            userId = user['user_id'] as int?;
            userProject = user['project']; // Set the userProject
          });
          print('User Data Snapshot: $user'); // Log user data snapshot
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

  Future<int?> fetchTestingData() async {
    try {
      await fetchUserData(
          widget.username); // Fetch user data to get userProject
      int? projectId = await fetchProject(userProject!);

      if (projectId == null || csrfTokenHandler.csrfToken == null) {
        print(
            'Failed to fetch project data or CSRF token not available. Aborting request.');
        return null;
      }
      String formattedDateTime =
          DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now());

      Map<String, dynamic> testingData = {
        'work_types_id': 1,
        'project': projectId,
        'activity_id': 2,
        'sub_activities_id': 1,
        'user_id': userId,
        'time_at': formattedDateTime,
        'latitude': '123.456',
        'longitude': '789.012',
        'sta_start': double.tryParse(staController1.text) ?? 0.0,
        'sta_to': double.tryParse(staController2.text) ?? 0.0,
      };

      final response = await http.post(
        Uri.parse(
            '${DjangoConstants.backendBaseUrl}/equality/testing-list/'),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfTokenHandler.csrfToken!,
        },
        body: jsonEncode(testingData),
      );

      if (response.statusCode == 201) {
        print('testing data successfully submitted!');
        print(response.body);
        final testingId = jsonDecode(response.body)['id'];
        return testingId!;
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

  Future<int?> fetchSandconeHeader() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return null;
    }

    try {
      int? testingId = await fetchTestingData();
    // Replace these with your Django backend details
    const String baseUrl = 'http://10.0.2.2:8000'; // Replace with your Django backend base URL
    const String sandconeheaderUrl = '$baseUrl/equality/sandcones/';
    //String userProject = await getUserProject(loggedInUsername);

    Map<String, dynamic> formData = {
      'testing_id': testingId,
      'source_material': sourceMaterialController.text,
      'mdds': double.tryParse(mddsController.text) ?? 0.0,
      'omcs': double.tryParse(omcsController.text) ?? 0.0,
    };

    
      final response = await http.post(
        Uri.parse(sandconeheaderUrl),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfTokenHandler.csrfToken!,
        },
        body: jsonEncode(formData),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('respon: $responseData');
        return responseData['id'];
      } else {
        print('Submit failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Error during Submit: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sandcone Tanah',
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20, right: 20, bottom: 20),
            child: Column(children: <Widget>[
              CustomInfoCard(
                locationText: "Some Location",
                username: loggedInUsername,
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Column(
                  children: <Widget>[
                    inputFile(
                        label:
                            "Sumber Material",
                            controller: sourceMaterialController), // pilihan dari sumber material persiapan bahan
                    TwoFieldsWithLabel(
                                label: "Sta.", controller1: staController1, controller2: staController2,),
                    inputFile(
                        label: "Max Dry Density (MDD)",
                        suffixText:"gram",
                        controller: mddsController), // otomatis terisi dari persiapan bahan dengan sumber material yang dipilih
                    inputFile(
                        label: "Optimum Moisture Content (OMC)",
                        suffixText:"%",
                        controller: omcsController), // otomatis terisi dari persiapan bahan dengan sumber material yang dipilih
                  ],
                ),
              ),
              CustomTitleButton(
                title: 'Field Density Test',
                onPressed: () async {
                  await fetchSandconeHeader();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ListSandconeTanahDetail(), 
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CustomTitle(text: 'Summary of Sandcone Soil Testing'),
              ),
              const SizedBox(height: 10.0), // Add some spacing
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black), // Add border to DataTable
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Side')),
                    DataColumn(label: Text('Wt.Content')),
                    DataColumn(label: Text('Density')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('Row 1, Col 1')),
                      DataCell(Text('Row 1, Col 2')),
                      DataCell(Text('Row 1, Col 3')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Row 2, Col 1')),
                      DataCell(Text('Row 2, Col 2')),
                      DataCell(Text('Row 2, Col 3')),
                    ]),
                    // Add more DataRow entries as needed
                  ],
                ),
              ),
              const SizedBox(height: 16.0), // Add some spacing
              CustomTextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListSandconeTanahHeader()));
                },
                text: 'Submit',
              ),
            ]),
          ),
        ),
      ),
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
