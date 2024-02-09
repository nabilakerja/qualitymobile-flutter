// ignore_for_file: avoid_print, use_build_context_synchronously, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hki_quality/API/csrf_token.dart';
import 'package:hki_quality/screens/berita_acara_list.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/button_upload.dart';
import 'package:hki_quality/widget/header.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class BeritaAcaraFormPage extends StatefulWidget {
  final String username;

  const BeritaAcaraFormPage({
    super.key,
    required this.username,
  });

  @override
  _BeritaAcaraFormPageState createState() => _BeritaAcaraFormPageState();
}

class _BeritaAcaraFormPageState extends State<BeritaAcaraFormPage> {
  int? headerBeritaAcaraId;

  late CSRFTokenHandler csrfTokenHandler;
  late Future<Map<String, dynamic>> userData;
  late String formattedDate;
  String? userProject;
  int? preparationId;
  int? userId;
  String? csrfToken;

  TextEditingController kegiatanController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

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

  Future<int?> fetchPreparationData() async {
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

      Map<String, dynamic> preparationData = {
        'work_types_id': 1,
        'project': projectId,
        'activity_id': 2,
        'sub_activities_id': 2,
        'user_id': userId,
        'time_at': formattedDateTime,
        'latitude': '123.456',
        'longitude': '789.012',
      };

      final response = await http.post(
        Uri.parse(
            '${DjangoConstants.backendBaseUrl}/equality/preparations-list/'),
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
        return preparationId!;
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

  Future<int?> fetchBeritaAcara() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return null;
    }
    try {
      int? preparationId = await fetchPreparationData();
      // Replace these with your Django backend details
      const String baseUrl =
          'http://10.0.2.2:8000'; // Replace with your Django backend base URL
      const String beritaacaraUrl = '$baseUrl/equality/header-berita-acara/';

      print('print id ini : $preparationId');
      Map<String, dynamic> formData = {
        'preparations_id': preparationId,
        'activity_id': 2,
        'kegiatan': kegiatanController.text,
        'information': keteranganController.text,
      };

      final response = await http.post(
        Uri.parse(beritaacaraUrl),
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

  Future<void> fetchDetailBeritaAcara(int headerBeritaAcaraId) async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return;
    }

    try {
      for (DataRow row in dataRows) {
        final response = await http.post(
          Uri.parse(
              'http://10.0.2.2:8000/equality/header-berita-acara/$headerBeritaAcaraId/detail-berita-acara/'),
          headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrfTokenHandler.csrfToken!,
          },
          body: jsonEncode({
            'name': (row.cells[0].child as Text).data!,
            'company': (row.cells[1].child as Text).data!,
            'position': (row.cells[2].child as Text).data!,
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

  /**Future<Map<String, dynamic>> fetchHeaderBeritaAcara(String kegiatan, String keterangan) async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/equality/get_id_header_berita_acara/get_id_header_berita_acara/?kegiatan=some_value&keterangan=some_value'),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return json.decode(response.body);
      //check response ada datanya gak?
      //kalau ada
      // panggil yang modals id dari response['id']
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }**/

  Future<void> _showAddItemDialog(
      BuildContext context, int headerBeritaAcaraId) async {
    TextEditingController namaController = TextEditingController();
    TextEditingController perusahaanController = TextEditingController();
    TextEditingController jabatanController = TextEditingController();

    print('ID Header: $headerBeritaAcaraId');
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Daftar Hadir'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField('Nama', namaController),
                _buildInputField('Perusahaan', perusahaanController),
                _buildInputField('Jabatan', jabatanController),
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
                      DataCell(Text(namaController.text)),
                      DataCell(Text(perusahaanController.text)),
                      DataCell(Text(jabatanController.text)),
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
    String apiUrl = 'http://10.0.2.2:8000/equality/check-data-existence/';
    String kegiatan = kegiatanController.text;
    String information = keteranganController.text;

    http.get(Uri.parse('$apiUrl$kegiatan/$information/')).then((response) {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        bool exists = data['exists'];

        if (exists) {
          int headerBeritaAcaraId = data['id'];
          print('Data exists. headerBeritaAcaraId: $headerBeritaAcaraId');

          _showAddItemDialog(context, headerBeritaAcaraId);
        } else {
          print('Data does not exist. Fetching headerBeritaAcaraId...');

          fetchBeritaAcara().then((id) {
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
        title: 'Berita Acara',
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
                          label: "Kegiatan", controller: kegiatanController),
                      inputFile(
                          label: "Keterangan",
                          controller: keteranganController),
                    ],
                  ),
                ),
                CustomTitle(
                  text: 'Daftar Hadir',
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
                      DataColumn(label: Text('Nama')),
                      DataColumn(label: Text('Perusahaan')),
                      DataColumn(label: Text('Jabatan')),
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
                        'http://10.0.2.2:8000/equality/check-data-existence/';
                    String kegiatan = kegiatanController.text;
                    String information = keteranganController.text;

                    try {
                      final response = await http
                          .get(Uri.parse('$apiUrl$kegiatan/$information/'));

                      if (response.statusCode == 200) {
                        final Map<String, dynamic> data =
                            json.decode(response.body);
                        bool exists = data['exists'];

                        if (exists) {
                          int headerBeritaAcaraId = data['id'];
                          print(
                              'Data exists. headerBeritaAcaraId: $headerBeritaAcaraId');

                          fetchDetailBeritaAcara(headerBeritaAcaraId);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListBeritaAcara()),
                          );

                          // Your existing logic here...
                        } else {
                          print(
                              'Data does not exist. Fetching headerBeritaAcaraId...');

                          int? id = await fetchBeritaAcara();
                          if (id != null) {
                            print('Fetched headerBeritaAcaraId: $id');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListBeritaAcara()),
                            );

                            // Your existing logic here...
                          } else {
                            print('Failed to fetch headerBeritaAcaraId.');
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
