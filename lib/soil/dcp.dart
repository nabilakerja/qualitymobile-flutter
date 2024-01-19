// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, avoid_print

import 'dart:convert';
import 'package:hki_quality/API/csrf_token.dart';
import 'package:hki_quality/soil/dcp_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class DCPFormPage extends StatefulWidget {
  const DCPFormPage({super.key, required this.username});

  final String username;

  @override
  _DCPFormPageState createState() => _DCPFormPageState();
}

class _DCPFormPageState extends State<DCPFormPage> {
  late Future<Map<String, dynamic>> userData;

  int? headerDCPId;

  late CSRFTokenHandler csrfTokenHandler;
  String? csrfToken;

  TextEditingController itempekController = TextEditingController();
  TextEditingController materialController = TextEditingController();
  TextEditingController staawalController = TextEditingController();
  TextEditingController staakhirController = TextEditingController();

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

  Future<int?> fetchDCP() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return null;
    }

    // Replace these with your Django backend details
    const String baseUrl =
        'http://10.0.2.2:8000'; // Replace with your Django backend base URL
    const String dcpUrl = '$baseUrl/equality/header-dcp/';
    //String userProject = await getUserProject(loggedInUsername);

    Map<String, dynamic> formData = {
      //'project': userProject,
      'pack_items': itempekController.text,
      'material': materialController.text,
      'sta_start': double.parse(staawalController.text),
      'sta_to': double.parse(staakhirController.text),
    };

    try {
      final response = await http.post(
        Uri.parse(dcpUrl),
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

  Future<void> fetchDetailDCP(int headerDCPId) async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return;
    }

    try {
      for (DataRow row in dataRows) {
        final response = await http.post(
          Uri.parse(
              'http://10.0.2.2:8000/equality/header-dcp/$headerDCPId/detail-dcp/'),
          headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrfTokenHandler.csrfToken!,
          },
          body: jsonEncode({
            'tumbukan': (row.cells[0].child as Text).data!,
            'ruler_reading': (row.cells[1].child as Text).data!,
            // Add other fields as needed
          }),
        );

        if (response.statusCode == 201) {
          print('Data saved successfully');
        } else {
          print('Submit failed. Status codeeee: ${response.statusCode}');
          print('Response body: ${response.body}');
          return;
        }
      }
    } catch (error) {
      print('Error during save: $error');
    }
  }

  Future<void> _showAddItemDialog(BuildContext context, int headerDCPId) async {
    TextEditingController tumbukanController = TextEditingController();
    TextEditingController mistarController = TextEditingController();

    print('ID Header: $headerDCPId');
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dynamic Cone Penetrometer'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField('Tumbukan', tumbukanController),
                _buildInputField('Pembacaan Mistar', mistarController)
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the entered data to the DataTable
                setState(() {
                  dataRows.add(
                    DataRow(cells: [
                      DataCell(Text(tumbukanController.text)),
                      DataCell(Text(mistarController.text)),
                    ]),
                  );
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void _onRowTap() {
    String apiUrl = 'http://10.0.2.2:8000/equality/check-data-dcp/';

    int packItems = int.parse(itempekController.text);
    String material = materialController.text;
    double staStart = double.parse(staawalController.text);
    double staTo = double.parse(staakhirController.text);

    http
        .get(Uri.parse('$apiUrl$packItems/$material/$staStart/$staTo/'))
        .then((response) {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        bool exists = data['exists'];

        if (exists) {
          int headerBeritaAcaraId = data['id'];
          print('Data exists. headerBeritaAcaraId: $headerBeritaAcaraId');

          _showAddItemDialog(context, headerBeritaAcaraId);
        } else {
          print('Data does not exist. Fetching headerBeritaAcaraId...');

          fetchDCP().then((id) {
            print(id);
            if (id != null) {
              print('Fetched headerBeritaAcaraId: $id');
              _showAddItemDialog(context, id);
            } else {
              print('Failed to fetch headerBeritaAcaraId.');
            }
          });
        }
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dynamic Cone Penetrometer Pekerjaan Tanah',
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
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      inputFile(
                          label: "Testing by",
                          initialValue: loggedInUsername,
                          enabled: false), //Otomatis terisi dengan nama user
                      inputFile(
                          label: "Item Pek", controller: itempekController),
                      inputFile(
                          label: "Material", controller: materialController),
                      TwoFieldsWithLabel(
                        label: "Sta.",
                        controller1: staawalController,
                        controller2: staakhirController,
                      ),
                    ],
                  ),
                ),
                CustomTitle(
                  text: 'Data Lapangan',
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          _onRowTap(); // Pass rowIndex if needed
                        },
                        child: Image.asset("assets/image/plus.png"),
                      )
                    ],
                  ),
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
                      DataColumn(label: Text('Tumbukan')),
                      DataColumn(label: Text('Pembacaan Mistar')),
                    ],
                    rows: dataRows,
                  ),
                ),
                const SizedBox(height: 20.0),
                const ButtonUpload(),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () async {
                    String apiUrl =
                        'http://10.0.2.2:8000/equality/check-data-dcp/';

                    int packItems = int.parse(itempekController.text);
                    String material = materialController.text;
                    double staStart = double.parse(staawalController.text);
                    double staTo = double.parse(staakhirController.text);

                    try {
                      final response = await http.get(Uri.parse(
                          '$apiUrl$packItems/$material/$staStart/$staTo/'));

                      if (response.statusCode == 200) {
                        final Map<String, dynamic> data =
                            json.decode(response.body);
                        bool exists = data['exists'];

                        if (exists) {
                          int headerDCPId = data['id'];
                          print('Data exists. headerDCPId: $headerDCPId');

                          fetchDetailDCP(headerDCPId);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListDCPSoil()),
                          );

                          // Your existing logic here...
                        } else {
                          print('Data does not exist. Fetching headerDCPId...');

                          int? id = await fetchDCP();
                          if (id != null) {
                            print('Fetched headerDCPId: $id');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListDCPSoil()),
                            );

                            // Your existing logic here...
                          } else {
                            print('Failed to fetch headerDCPId.');
                          }
                        }
                      } else {
                        print(
                            'Failed to fetch data. Status code: ${response.statusCode}');
                      }
                    } catch (error) {
                      print('Error: $error');
                    }
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
