// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, avoid_print, unnecessary_null_comparison

import 'dart:convert';

import 'package:hki_quality/API/csrf_token.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/soil/cbr_list.dart';
import 'package:hki_quality/widget/threefield.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/dropdown.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';
import 'package:intl/intl.dart';

class CBRFieldPage extends StatefulWidget {
  final String username;

  const CBRFieldPage({
    super.key,
    required this.username,
  });

  @override
  _CBRFieldPageState createState() => _CBRFieldPageState();
}

class _CBRFieldPageState extends State<CBRFieldPage> {
  String? selectedSisi;
  List<dynamic> sisi = ['L1', 'L2', 'L3', 'R1', 'R2', 'R3'];

  double kalibrasiProvingValue = 0.0;
  double readDialUp0Value = 0.0;
  double readDialUp14Value = 0.0;
  double readDialUp12Value = 0.0;
  double readDialUp1Value = 0.0;
  double readDialUp112Value = 0.0;
  double readDialUp2Value = 0.0;
  double readDialUp3Value = 0.0;
  double readDialUp4Value = 0.0;
  double readDialUp6Value = 0.0;
  double readDialUp8Value = 0.0;
  double readDialUp10Value = 0.0;


  TextEditingController staController1 = TextEditingController();
  TextEditingController staController2 = TextEditingController();
  final TextEditingController testingIdController = TextEditingController();
  final TextEditingController sourceMaterialController =
      TextEditingController();
  final TextEditingController sideController = TextEditingController();
  final TextEditingController kalibrasiProvingController =
      TextEditingController();
  final TextEditingController penetrationInc0Controller =
      TextEditingController();
  final TextEditingController readDialUp0Controller = TextEditingController();
  final TextEditingController loadUp0Controller = TextEditingController();
  final TextEditingController penetrationInc14Controller =
      TextEditingController();
  final TextEditingController readDialUp14Controller = TextEditingController();
  final TextEditingController loadUp14Controller = TextEditingController();
  final TextEditingController penetrationInc12Controller =
      TextEditingController();
  final TextEditingController readDialUp12Controller = TextEditingController();
  final TextEditingController loadUp12Controller = TextEditingController();
  final TextEditingController penetrationInc1Controller =
      TextEditingController();
  final TextEditingController readDialUp1Controller = TextEditingController();
  final TextEditingController loadUp1Controller = TextEditingController();
  final TextEditingController penetrationInc112Controller =
      TextEditingController();
  final TextEditingController readDialUp112Controller = TextEditingController();
  final TextEditingController loadUp112Controller = TextEditingController();
  final TextEditingController penetrationInc2Controller =
      TextEditingController();
  final TextEditingController readDialUp2Controller = TextEditingController();
  final TextEditingController loadUp2Controller = TextEditingController();
  final TextEditingController penetrationInc3Controller =
      TextEditingController();
  final TextEditingController readDialUp3Controller = TextEditingController();
  final TextEditingController loadUp3Controller = TextEditingController();
  final TextEditingController penetrationInc4Controller =
      TextEditingController();
  final TextEditingController readDialUp4Controller = TextEditingController();
  final TextEditingController loadUp4Controller = TextEditingController();
  final TextEditingController penetrationInc6Controller =
      TextEditingController();
  final TextEditingController readDialUp6Controller = TextEditingController();
  final TextEditingController loadUp6Controller = TextEditingController();
  final TextEditingController penetrationInc8Controller =
      TextEditingController();
  final TextEditingController readDialUp8Controller = TextEditingController();
  final TextEditingController loadUp8Controller = TextEditingController();
  final TextEditingController penetrationInc10Controller =
      TextEditingController();
  final TextEditingController readDialUp10Controller = TextEditingController();
  final TextEditingController loadUp10Controller = TextEditingController();

  late CSRFTokenHandler csrfTokenHandler;
  late Future<Map<String, dynamic>> userData;
  late String formattedDate;
  String? userProject;
  int? testingId;
  int? userId;
  String? csrfToken;
  List<DataRow> dataRows = [];
  List<dynamic> layer = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'TSG'];

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
        Uri.parse('${DjangoConstants.backendBaseUrl}/equality/testing-list/'),
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

  Future<int?> fetchCBRLapangan() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return null;
    }

    try {
      int? testingId = await fetchTestingData();
      // Replace these with your Django backend details
      const String baseUrl =
          'http://10.0.2.2:8000'; // Replace with your Django backend base URL
      const String sandconedetailUrl = '$baseUrl/equality/cbr-lapangan/';
      //String userProject = await getUserProject(loggedInUsername);

      Map<String, dynamic> formData = {
        'testing_id': testingId,
        //'source_material': sourceMaterialController.text,
        'side': selectedSisi,
        'kalibrasi_proving':
            double.tryParse(kalibrasiProvingController.text) ?? 0.0,
        'penetration_inc_0':
            double.tryParse(penetrationInc0Controller.text) ?? 0.0,
        'read_dial_up_0': double.tryParse(readDialUp0Controller.text) ?? 0.0,
        'load_up_0': double.tryParse(loadUp0Controller.text) ?? 0.0,
        'penetration_inc_1_4':
            double.tryParse(penetrationInc14Controller.text) ?? 0.0,
        'read_dial_up_1_4': double.tryParse(readDialUp14Controller.text) ?? 0.0,
        'load_up_1_4': double.tryParse(loadUp14Controller.text) ?? 0.0,
        'penetration_inc_1_2':
            double.tryParse(penetrationInc12Controller.text) ?? 0.0,
        'read_dial_up_1_2': double.tryParse(readDialUp12Controller.text) ?? 0.0,
        'load_up_1_2': double.tryParse(loadUp12Controller.text) ?? 0.0,
        'penetration_inc_1':
            double.tryParse(penetrationInc1Controller.text) ?? 0.0,
        'read_dial_up_1': double.tryParse(readDialUp1Controller.text) ?? 0.0,
        'load_up_1': double.tryParse(loadUp1Controller.text) ?? 0.0,
        'penetration_inc_1_12':
            double.tryParse(penetrationInc112Controller.text) ?? 0.0,
        'read_dial_up_1_12':
            double.tryParse(readDialUp112Controller.text) ?? 0.0,
        'load_up_1_12': double.tryParse(loadUp112Controller.text) ?? 0.0,
        'penetration_inc_2':
            double.tryParse(penetrationInc2Controller.text) ?? 0.0,
        'read_dial_up_2': double.tryParse(readDialUp2Controller.text) ?? 0.0,
        'load_up_2': double.tryParse(loadUp2Controller.text) ?? 0.0,
        'penetration_inc_3':
            double.tryParse(penetrationInc3Controller.text) ?? 0.0,
        'read_dial_up_3': double.tryParse(readDialUp3Controller.text) ?? 0.0,
        'load_up_3': double.tryParse(loadUp3Controller.text) ?? 0.0,
        'penetration_inc_4':
            double.tryParse(penetrationInc4Controller.text) ?? 0.0,
        'read_dial_up_4': double.tryParse(readDialUp4Controller.text) ?? 0.0,
        'load_up_4': double.tryParse(loadUp4Controller.text) ?? 0.0,
        'penetration_inc_6':
            double.tryParse(penetrationInc6Controller.text) ?? 0.0,
        'read_dial_up_6': double.tryParse(readDialUp6Controller.text) ?? 0.0,
        'load_up_6': double.tryParse(loadUp6Controller.text) ?? 0.0,
        'penetration_inc_8':
            double.tryParse(penetrationInc8Controller.text) ?? 0.0,
        'read_dial_up_8': double.tryParse(readDialUp8Controller.text) ?? 0.0,
        'load_up_8': double.tryParse(loadUp8Controller.text) ?? 0.0,
        'penetration_inc_10':
            double.tryParse(penetrationInc10Controller.text) ?? 0.0,
        'read_dial_up_10': double.tryParse(readDialUp10Controller.text) ?? 0.0,
        'load_up_10': double.tryParse(loadUp10Controller.text) ?? 0.0,
      };

      final response = await http.post(
        Uri.parse(sandconedetailUrl),
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
        title: 'CBR Field Pekerjaan Tanah',
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
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
                        label: "Sumber Material",
                        controller:
                            null), // pilihan dari sumber material persiapan bahan
                    TwoFieldsWithLabel(
                      label: "Sta.",
                      controller1: staController1,
                      controller2: staController2,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    DropdownWidget(
                      hintText: 'Pilih Sisi L/R',
                      label: "Sisi",
                      selectedValue: selectedSisi,
                      items: sisi,
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedSisi = value;
                        });
                      },
                    ),
                    inputFile<int>(
                      label: "Kalibrasi Proving Ring",
                      controller: kalibrasiProvingController,
                      onSubmitted: (double value) {
                        setState(() {
                          kalibrasiProvingValue = value; // Update the variable
                        });
                        print('Submitted Integer: $kalibrasiProvingValue');
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
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
                    padding: const EdgeInsets.only(left: 20),
                    width: 95,
                    child: const Text("Penetration (inch)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14.0,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: 95,
                    child: const Text("Read of Dial Upper",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14.0,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: 95,
                    child: const Text("Load (Lbs) Upper",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14.0,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ThreeFieldsWithLabel(
                label: '0',
                controller1: penetrationInc0Controller,
                controller2: readDialUp0Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp0Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 0: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp0Controller,
              ),
              ThreeFieldsWithLabel(
                label: '1/4',
                controller1: penetrationInc14Controller,
                controller2: readDialUp14Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp14Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 14: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp14Controller,
              ),
              ThreeFieldsWithLabel(
                label: '1/2',
                controller1: penetrationInc12Controller,
                controller2: readDialUp12Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp12Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 1/2: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp12Controller,
              ),
              ThreeFieldsWithLabel(
                label: '1',
                controller1: penetrationInc1Controller,
                controller2: readDialUp1Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp1Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 1: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp1Controller,
              ),
              ThreeFieldsWithLabel(
                label: '1 1/2',
                controller1: penetrationInc112Controller,
                controller2: readDialUp112Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp112Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 1 1/2: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp112Controller,
              ),
              ThreeFieldsWithLabel(
                label: '2',
                controller1: penetrationInc2Controller,
                controller2: readDialUp2Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp2Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 2: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp2Controller,
              ),
              ThreeFieldsWithLabel(
                label: '3',
                controller1: penetrationInc3Controller,
                controller2: readDialUp3Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp3Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 3: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp3Controller,
              ),
              ThreeFieldsWithLabel(
                label: '4',
                controller1: penetrationInc4Controller,
                controller2: readDialUp4Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp4Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 4: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp4Controller,
              ),
              ThreeFieldsWithLabel(
                label: '6',
                controller1: penetrationInc6Controller,
                controller2: readDialUp6Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp6Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 6: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp6Controller,
              ),
              ThreeFieldsWithLabel(
                label: '8',
                controller1: penetrationInc8Controller,
                controller2: readDialUp8Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp8Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 8: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp8Controller,
              ),
              ThreeFieldsWithLabel(
                label: '10',
                controller1: penetrationInc10Controller,
                controller2: readDialUp10Controller,
                onSubmitted2: (double value) {
                  setState(() {
                    readDialUp10Value = value; // Update the variable
                    formulaResult(); 
                  });
                  print('Read Dial Up 10: $value');
                  // Handle the submitted value for Field 1
                },
                controller3: loadUp10Controller,
              ),
              const SizedBox(
                height: 15,
              ),
              const ButtonUpload(),
              const SizedBox(height: 16.0), // Add some spacing
              CustomTextButton(
                onPressed: () async {
                  await fetchCBRLapangan();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ListCBRSoil(), // Replace YourNextScreen with the actual widget for the next screen
                    ),
                  );
                },
                text: 'Submit',
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void formulaResult() {
    // Lakukan operasi matematika
    double loadUp0 =  readDialUp0Value * kalibrasiProvingValue;
    double loadUp14 = readDialUp14Value * kalibrasiProvingValue;
    double loadUp12 = readDialUp12Value * kalibrasiProvingValue;
    double loadUp1 = readDialUp1Value * kalibrasiProvingValue;
    double loadUp112 = readDialUp112Value * kalibrasiProvingValue;
    double loadUp2 = readDialUp2Value * kalibrasiProvingValue;
    double loadUp3 = readDialUp3Value * kalibrasiProvingValue;
    double loadUp4 = readDialUp4Value * kalibrasiProvingValue;
    double loadUp6 = readDialUp6Value * kalibrasiProvingValue;
    double loadUp8 = readDialUp8Value * kalibrasiProvingValue;
    double loadUp10 = readDialUp10Value * kalibrasiProvingValue;

    print('hasil : $loadUp0');
    // Tampilkan hasil pada field output
    //loadUp0Controller.text = loadUp0.toStringAsFixed(2);
    if (readDialUp0Value != null) {
        print('hasil : $loadUp0');
        
        // Tampilkan hasil pada field output
        loadUp0Controller.text = loadUp0.toStringAsFixed(2);
    }
    if (readDialUp14Value != 0) {
        print('hasil : $loadUp14');
        
        // Tampilkan hasil pada field output
        loadUp14Controller.text = loadUp14.toStringAsFixed(2);
    }
    if (readDialUp12Value != 0) {
        print('hasil : $loadUp12');
        
        // Tampilkan hasil pada field output
        loadUp12Controller.text = loadUp12.toStringAsFixed(2);
    }
    if (readDialUp1Value != 0) {
        print('hasil : $loadUp1');
        
        // Tampilkan hasil pada field output
        loadUp1Controller.text = loadUp1.toStringAsFixed(2);
    }
    if (readDialUp112Value != 0) {
        print('hasil : $loadUp112');
        
        // Tampilkan hasil pada field output
        loadUp112Controller.text = loadUp112.toStringAsFixed(2);
    }
    if (readDialUp2Value != 0) {
        print('hasil : $loadUp2');
        
        // Tampilkan hasil pada field output
        loadUp2Controller.text = loadUp2.toStringAsFixed(2);
    }
    if (readDialUp3Value != 0) {
        print('hasil : $loadUp3');
        
        // Tampilkan hasil pada field output
        loadUp3Controller.text = loadUp3.toStringAsFixed(2);
    }
    if (readDialUp4Value != 0) {
        print('hasil : $loadUp4');
        
        // Tampilkan hasil pada field output
        loadUp4Controller.text = loadUp4.toStringAsFixed(2);
    }
    if (readDialUp6Value != 0) {
        print('hasil : $loadUp6');
        
        // Tampilkan hasil pada field output
        loadUp6Controller.text = loadUp6.toStringAsFixed(2);
    }
    if (readDialUp8Value != 0) {
        print('hasil : $loadUp8');
        
        // Tampilkan hasil pada field output
        loadUp8Controller.text = loadUp8.toStringAsFixed(2);
    }
    if (readDialUp10Value != 0) {
        print('hasil : $loadUp10');
        
        // Tampilkan hasil pada field output
        loadUp10Controller.text = loadUp10.toStringAsFixed(2);
    }
  }
}
