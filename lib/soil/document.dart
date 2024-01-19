// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, avoid_print

import 'dart:convert';
import 'package:hki_quality/API/csrf_token.dart';
import 'package:hki_quality/soil/document_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/cont_slider.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/screens/kalibrasi.dart';
import 'package:hki_quality/widget/title_custom_button.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class KelengkapanDokumenController extends ChangeNotifier {
  CustomContainerController shopdrawingController =
      CustomContainerController();
  CustomContainerController metodekerjaController =
      CustomContainerController();
  CustomContainerController jointsurveyController =
      CustomContainerController();
  CustomContainerController jobsafetyController =
      CustomContainerController();
  CustomContainerController sertifikatoperasiController =
      CustomContainerController();
  CustomContainerController suratlayakoperasiController =
      CustomContainerController();
  CustomContainerController patokController =
      CustomContainerController();
  CustomContainerController sattlemetnController =
      CustomContainerController();

  int convertBoolToInt(bool value) {
    return value ? 1 : 0;
  }
}

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  late CSRFTokenHandler csrfTokenHandler;

  String? csrfToken;

  TextEditingController staController1 = TextEditingController();
  TextEditingController staController2 = TextEditingController();
  TextEditingController opsionalController = TextEditingController();
  TextEditingController avgsandController = TextEditingController();
  
  final KelengkapanDokumenController _controller = KelengkapanDokumenController();


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

  Future<void> fetchKelengkapanDokumen() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return;
    }

    // Replace these with your Django backend details
    const String baseUrl = 'http://10.0.2.2:8000'; // Replace with your Django backend base URL
    const String kelengkapandokumenUrl = '$baseUrl/equality/kelengkapan-dokumen-list/';
    //String userProject = await getUserProject(loggedInUsername);

    bool shopdrawing = _controller.shopdrawingController.isSwitched;
    bool metodekerja = _controller.metodekerjaController.isSwitched;
    bool jointsurvey = _controller.jointsurveyController.isSwitched;
    bool jobsafety = _controller.jobsafetyController.isSwitched;
    bool sertifikatoperasi = _controller.sertifikatoperasiController.isSwitched;
    bool suratlayakoperasi = _controller.suratlayakoperasiController.isSwitched;
    bool patok = _controller.patokController.isSwitched;
    bool sattlemetn = _controller.sattlemetnController.isSwitched;

    // Convert bool to int using the convertBoolToInt method
    int shopdrawingInt = _controller.convertBoolToInt(shopdrawing);
    String shopdrawingValue = shopdrawingInt == 0 ? 'yes' : 'no';

    int metodekerjaInt = _controller.convertBoolToInt(metodekerja);
    String metodekerjaValue = metodekerjaInt == 0 ? 'yes' : 'no';

    int jointsurveyInt = _controller.convertBoolToInt(jointsurvey);
    String jointsurveyValue = jointsurveyInt == 0 ? 'yes' : 'no';

    int jobsafetyInt = _controller.convertBoolToInt(jobsafety);
    String jobsafetyValue = jobsafetyInt == 0 ? 'yes' : 'no';

    int sertifikatoperasiInt = _controller.convertBoolToInt(sertifikatoperasi);
    String sertifikatoperasiValue = sertifikatoperasiInt == 0 ? 'yes' : 'no';

    int suratlayakoperasiInt = _controller.convertBoolToInt(suratlayakoperasi);
    String suratlayakoperasiValue = suratlayakoperasiInt == 0 ? 'yes' : 'no';

    int patokInt = _controller.convertBoolToInt(patok);
    String patokValue = patokInt == 0 ? 'yes' : 'no';

    int sattlemetnInt = _controller.convertBoolToInt(sattlemetn);
    String sattlemetnValue = sattlemetnInt == 0 ? 'yes' : 'no';

    Map<String, dynamic> formData = {
      //'project': userProject,
      'sta_start': double.tryParse(staController1.text) ?? 0.0,
      'sta_to': double.tryParse(staController2.text) ?? 0.0,
      'shop_drawing': shopdrawingValue,
      'working_method': metodekerjaValue,
      'joint_survey': jointsurveyValue,
      'job_safety_analys': jobsafetyValue,
      'sert_op_permit': sertifikatoperasiValue,
      'layak_operasi':suratlayakoperasiValue,
      'patok': patokValue,
      'sattlement_plate': sattlemetnValue,
      'opsional': opsionalController.text,
      //'avg_sand': double.tryParse(avgsandController.text) ?? 0.0,
    };

    try {
      final response = await http.post(
        Uri.parse(kelengkapandokumenUrl),
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
        title: 'Kelengkapan Dokumen Persiapan',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomInfoCard(
                  locationText: "Some Location",
                  username: loggedInUsername,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Sumber Material"),
                      TwoFieldsWithLabel(
                        label: "Sta.",
                        controller1: staController1,
                        controller2: staController2,
                      ),
                    ],
                  ),
                ),
                CustomTitle(
                  text: 'Pengajuan Izin Kerja',
                ),
               CustomContainerSlider(
                  text: 'Shop Drawing',
                  controller: _controller.shopdrawingController,
                ),
                CustomContainerSlider(
                  text: 'Metode Kerja',
                  controller: _controller.metodekerjaController,
                ),
                CustomContainerSlider(
                  text: 'Joint Survey',
                  controller: _controller.jointsurveyController,
                ),
                CustomContainerSlider(
                  text: 'Job Safety Analysis',
                  controller: _controller.jobsafetyController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(
                    text: 'Alat Berat',
                  ),
                ),
                CustomContainerSlider(
                  text: 'Sertifikat Izin Operator',
                  controller: _controller.sertifikatoperasiController,
                ),
                CustomContainerSlider(
                  text: 'Surat Izin Layak Operasi',
                  controller: _controller.suratlayakoperasiController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(
                    text: 'Alat Penunjang (Jika diperlukan)',
                  ),
                ),
                CustomContainerSlider(
                  text: 'Patok',
                  controller: _controller.patokController,
                ),
                CustomContainerSlider(
                  text: 'Sattlement Plate',
                  controller: _controller.sattlemetnController,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Lainnya (Optional)",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 315,
                      child: TextField(
                        controller: opsionalController,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 78, 78, 78)),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 78, 78, 78))),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        'assets/image/iconupload.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitleButton(
                    title: 'Kalibrasi',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Kalibrasi()));
                    },
                  ),
                ),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () async {
                    await fetchKelengkapanDokumen();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ListDocument(), // Replace YourNextScreen with the actual widget for the next screen
                      ),
                    );
                  },
                  text: 'Submit',
                ),
              ]),
        ),
      ),
    );
  }
}
