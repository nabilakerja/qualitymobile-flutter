// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hki_quality/screens/comment.dart';
import 'package:hki_quality/soil/sandconetanah_detaillist.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:http/http.dart' as http;

class ListSandconeTanahDetailDet extends StatefulWidget {
  const ListSandconeTanahDetailDet({super.key});

  @override
  _ListSandconeTanahDetailDetState createState() =>
      _ListSandconeTanahDetailDetState();
}

class _ListSandconeTanahDetailDetState
    extends State<ListSandconeTanahDetailDet> {
  List<dynamic> items = [];
  List<Map<String, dynamic>> preparations = [];
  List<String> selectedFilters = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
            '${DjangoConstants.backendBaseUrl}/equality/detail-sandcones-soil/'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);

        if (decodedData.isNotEmpty) {
          for (final Map<String, dynamic> item in decodedData) {
            final int sandconeId = item['id'];

            final detailResponse = await http.get(
              Uri.parse(
                  '${DjangoConstants.backendBaseUrl}/equality/detailsandconesoil/?sandcone_id=$sandconeId'),
            );

            if (detailResponse.statusCode == 200) {
              final List<dynamic> detailedData =
                  json.decode(detailResponse.body);

              final attendanceResponse = await http.get(
                Uri.parse(
                    '${DjangoConstants.backendBaseUrl}/equality/detailsandcone/$sandconeId/'),
              );
              if (attendanceResponse.statusCode == 200) {}

              setState(() {
                items.addAll(
                    detailedData); // Use addAll to append all elements from detailedData list
                items.sort((a, b) => b['id'].compareTo(a['id']));
              });
            } else {
              throw Exception(
                  'Failed to load detailed data for ID: $sandconeId');
            }
          }
        } else {
          print('No data available');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          title: 'Approval Material Pekerjaan Tanah',
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 20.0,
                          ),
                        ],
                      ),
                      child: ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Titik Sta. ${items[index]['sta_point_start']} + ${items[index]['sta_point_to']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Kedalaman Lubang : ${items[index]['hole_depth']}',
                              style: const TextStyle(color: Color(0xFF8696BB)),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 0.5,
                              color: const Color(0xFF8696BB),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    /**const SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Icon(Icons.location_on, color: Color(0xFF8696BB), size: 15)),**/
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'L/R : ${items[index]['side']}',
                                      style: const TextStyle(
                                          color: Color(0xFF8696BB)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Layer : ${items[index]['layer']}',
                                      style: const TextStyle(
                                          color: Color(0xFF8696BB)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 140,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SandconeTanahDetailListPage(
                                            item: items[index],
                                          ),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 219, 11, 11),
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Detail',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 219, 11, 11),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 25),
                                SizedBox(
                                  width: 140,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CommentPage(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 219, 11, 11),
                                      ),
                                    ),
                                    child: const Text(
                                      'Comment',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DjangoConstants {
  static const String backendBaseUrl = 'http://10.0.2.2:8000';
}
