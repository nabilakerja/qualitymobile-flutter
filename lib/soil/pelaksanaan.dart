// ignore_for_file: use_build_context_synchronously, avoid_print, library_private_types_in_public_api

import 'dart:convert';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/soil/pelaksanaan_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hki_quality/API/csrf_token.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/cont_slider2.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/twofield.dart';
import 'package:intl/intl.dart';

class SoilImplementationController extends ChangeNotifier {
  CustomContainerSliderController lapisanMaterialController =
      CustomContainerSliderController();
  CustomContainerSliderController ketebalanGemburController =
      CustomContainerSliderController();
  CustomContainerSliderController padatArahController =
      CustomContainerSliderController();
  CustomContainerSliderController areaTepiController =
      CustomContainerSliderController();
  CustomContainerSliderController permukaanRataController =
      CustomContainerSliderController();
  CustomContainerSliderController kemiringanLerengController =
      CustomContainerSliderController();
  CustomContainerSliderController lainnyaController =
      CustomContainerSliderController();
  CustomContainerSliderController eksistingController =
      CustomContainerSliderController();
  CustomContainerSliderController progress50Controller =
      CustomContainerSliderController();
  CustomContainerSliderController progress100Controller =
      CustomContainerSliderController();

  int convertBoolToInt(bool value) {
    return value ? 1 : 0;
  }
}

class PelaksanaanPage extends StatefulWidget {
  final String username;

  const PelaksanaanPage({
    super.key,
    required this.username,
  });

  @override
  _PelaksanaanPageState createState() => _PelaksanaanPageState();
}

class _PelaksanaanPageState extends State<PelaksanaanPage> {
  late CSRFTokenHandler csrfTokenHandler;
  late Future<Map<String, dynamic>> userData;
  late String formattedDate;
  String? userProject;
  int? implementationId;
  int? userId;
  String? csrfToken;

  TextEditingController pekerjaanController = TextEditingController();
  TextEditingController staController1 = TextEditingController();
  TextEditingController staController2 = TextEditingController();

  final SoilImplementationController _controller =
      SoilImplementationController();

  @override
  void initState() {
    super.initState();
    // Fetch CSRF token when the widget is initialized
    csrfTokenHandler = CSRFTokenHandler();
    // Fetch CSRF token when the widget is initialized
    fetchCSRFToken();
    userData = fetchUserData(widget.username);
  }

  Future<void> fetchCSRFToken() async {
    await csrfTokenHandler.fetchCSRFToken();
    // Access the csrfToken using csrfTokenHandler.csrfToken
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

  Future<int?> fetchImplementationData() async {
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

      Map<String, dynamic> implementationsData = {
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
            '${DjangoConstants.backendBaseUrl}/equality/implementations-list/'),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfTokenHandler.csrfToken!,
        },
        body: jsonEncode(implementationsData),
      );

      if (response.statusCode == 201) {
        print('implementation data successfully submitted!');
        print(response.body);
        final implementationId = jsonDecode(response.body)['id'];
        return implementationId!;
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

  Future<void> fetchPelaksanaanTanah() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return;
    }

    try {
      int? implementationId = await fetchImplementationData();
      // Replace these with your Django backend details
      const String baseUrl =
          'http://10.0.2.2:8000'; // Replace with your Django backend base URL
      const String pelaksanaantanahUrl =
          '$baseUrl/equality/soil-implementations/';
      //String userProject = await getUserProject(loggedInUsername);
      bool lapisan = _controller.lapisanMaterialController.isSwitched;
      print('Pekerjaan Lapisan Material: $lapisan');
      bool ketebalan = _controller.ketebalanGemburController.isSwitched;
      bool padatkan = _controller.padatArahController.isSwitched;
      bool areatepi = _controller.areaTepiController.isSwitched;
      bool permukaanrata = _controller.permukaanRataController.isSwitched;
      //print ('$areatepi - $permukaanrata - ${_controller.permukaanRataController.toString()}');
      bool kemiringan = _controller.kemiringanLerengController.isSwitched;
      bool lainnya = _controller.lainnyaController.isSwitched;
      bool eksisting = _controller.eksistingController.isSwitched;
      bool progress50 = _controller.progress50Controller.isSwitched;
      bool progress100 = _controller.progress100Controller.isSwitched;

      // Convert bool to int using the convertBoolToInt method
      int lapisanInt = _controller.convertBoolToInt(lapisan);
      print('Pekerjaan Lapisan Material : $lapisanInt');
      String layerMaterialValue = lapisanInt == 0 ? 'yes' : 'no';
      print('Pekerjaan Lapisan Material convert: $layerMaterialValue');

      int ketebalanInt = _controller.convertBoolToInt(ketebalan);
      String ketebalanValue = ketebalanInt == 0 ? 'yes' : 'no';

      int padatkanInt = _controller.convertBoolToInt(padatkan);
      String padatkanValue = padatkanInt == 0 ? 'yes' : 'no';

      int areatepiInt = _controller.convertBoolToInt(areatepi);
      String areatepiValue = areatepiInt == 0 ? 'yes' : 'no';

      int permukaanrataInt = _controller.convertBoolToInt(permukaanrata);
      print("flat survey");
      print(permukaanrata);
      String permukaanrataValue = permukaanrataInt == 0 ? 'yes' : 'no';

      int kemiringanInt = _controller.convertBoolToInt(kemiringan);
      String kemiringanValue = kemiringanInt == 0 ? 'yes' : 'no';

      int lainnyaInt = _controller.convertBoolToInt(lainnya);
      String lainnyaValue = lainnyaInt == 0 ? 'yes' : 'no';

      int eksistingInt = _controller.convertBoolToInt(eksisting);
      String eksistingValue = eksistingInt == 0 ? 'yes' : 'no';

      int progress50Int = _controller.convertBoolToInt(progress50);
      String progress50Value = progress50Int == 0 ? 'yes' : 'no';

      int progress100Int = _controller.convertBoolToInt(progress100);
      String progress100Value = progress100Int == 0 ? 'yes' : 'no';

      Map<String, dynamic> formData = {
        'impelemtation_id': implementationId,
        'work': pekerjaanController.text,
        'layer_material': layerMaterialValue,
        'brittle_thickness': ketebalanValue,
        'compacted': padatkanValue,
        'slope_area': areatepiValue,
        'flat_surface': permukaanrataValue,
        'slope': kemiringanValue,
        'opsional': lainnyaValue,
        'existing_0': eksistingValue,
        'spreading_50': progress50Value,
        'spreading_100': progress100Value,
      };

      final response = await http.post(
        Uri.parse(pelaksanaantanahUrl),
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
        title: 'Pelaksanaan Pekerjaan Tanah',
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                CustomInfoCard(
                  locationText: "Some Location",
                  username: loggedInUsername,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: <Widget>[
                      inputFile(
                          label: "Pekerjaan", controller: pekerjaanController),
                      TwoFieldsWithLabel(
                        label: "Sta.",
                        controller1: staController1,
                        controller2: staController2,
                      ),
                    ],
                  ),
                ),
                CustomContainerSlider2(
                  text:
                      'Lapisan material sebelum dipadatkan tidak lebih dari 20 cm, kecuali alat dapat memadatkan lebih dari 20 cm dengan kepadatan seragam.',
                  controller: _controller.lapisanMaterialController,
                ),
                CustomContainerSlider2(
                  text:
                      'Ketebalan gembur lapisan tidak melebihi 10 cm, dipadatkan dengan mechanical hammers.',
                  controller: _controller.ketebalanGemburController,
                ),
                CustomContainerSlider2(
                  text: 'Dipadatkan arah memanjang dan melintang.',
                  controller: _controller.padatArahController,
                ),
                CustomContainerSlider2(
                  text:
                      'Area tepi / lereng, dilebihkan ±50 cm, dipadatkan kemudian di-cutting dengan bucket excavator.',
                  controller: _controller.areaTepiController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(
                    text: 'Hasil Pekerjaan',
                  ),
                ),
                CustomContainerSlider2(
                  text: 'Permukaan rata / tidak bergelombang.',
                  controller: _controller.permukaanRataController,
                ),
                CustomContainerSlider2(
                  text: 'Kemiringan lereng / sloope sesuai desain.',
                  controller: _controller.kemiringanLerengController,
                ),
                CustomContainerSlider2(
                  text: 'Lainnya',
                  controller: _controller.lainnyaController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(
                    text: 'Dokumentasi',
                  ),
                ),
                CustomContainerSlider2(
                  text: 'Keadaan Eksisting (Progress 0%)',
                  controller: _controller.eksistingController,
                ),
                CustomContainerSlider2(
                  text: 'Proses Penghamparan dan Pemadatan (Progress 50%)',
                  controller: _controller.progress50Controller,
                ),
                CustomContainerSlider2(
                  text:
                      'Keadaan Setelah Penghamparan dan Pemadatan (Progress 100%)',
                  controller: _controller.progress100Controller,
                ),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () async {
                    await fetchPelaksanaanTanah();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ListPelaksanaan(), // Replace YourNextScreen with the actual widget for the next screen
                      ),
                    );
                  },
                  text: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
