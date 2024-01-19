// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:hki_quality/API/csrf_token.dart';
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


class SandconeHeaderPage extends StatefulWidget {
  const SandconeHeaderPage({super.key});

  @override
  _SandconeHeaderPageState createState() => _SandconeHeaderPageState();
}

class _SandconeHeaderPageState extends State<SandconeHeaderPage> {

  //final TextEditingController testingIdController = TextEditingController();
  final TextEditingController sourceMaterialController = TextEditingController();
  final TextEditingController mddsController = TextEditingController();
  final TextEditingController omcsController = TextEditingController();

  late CSRFTokenHandler csrfTokenHandler;
  String? csrfToken;
  List<DataRow> dataRows = [];

  @override
  void initState() {
    super.initState();
    csrfTokenHandler = CSRFTokenHandler();
    // Fetch CSRF token when the widget is initialized
    fetchCSRFToken();
  }

  Future<void> fetchCSRFToken() async {
    await csrfTokenHandler.fetchCSRFToken();
    // Now that CSRF token is available, you can proceed with other operations
  }

  Future<int?> fetchSandconeHeader() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return null;
    }

    // Replace these with your Django backend details
    const String baseUrl = 'http://10.0.2.2:8000'; // Replace with your Django backend base URL
    const String sandconeheaderUrl = '$baseUrl/equality/sandcones/';
    //String userProject = await getUserProject(loggedInUsername);

    Map<String, dynamic> formData = {
      //'testing_id': 1,
      'source_material': sourceMaterialController.text,
      'mdds': double.tryParse(mddsController.text) ?? 0.0,
      'omcs': double.tryParse(omcsController.text) ?? 0.0,
    };

    try {
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
                    const TwoFieldsWithLabel(
                                label: "Sta.", controller1: null, controller2: null,),
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
