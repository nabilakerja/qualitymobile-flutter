// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/berita_acara.dart';
import 'package:hki_quality/screens/berita_acara_detail.dart';
import 'package:hki_quality/screens/comment.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/bubblebutton.dart';
import 'package:http/http.dart' as http;

class ListBeritaAcara extends StatefulWidget {
  @override
  _ListBeritaAcaraState createState() => _ListBeritaAcaraState();
}

class _ListBeritaAcaraState extends State<ListBeritaAcara> {
  List<dynamic> items = [];
  List<Map<String, dynamic>> preparations = [];
  List<String> selectedFilters = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(
          '${DjangoConstants.backendBaseUrl}/equality/header-berita-acara/?Header_ba=YOUR_FILTER_VALUE'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);

      if (decodedData.isNotEmpty) {
        for (final Map<String, dynamic> item in decodedData) {
          final int beritaId = item['id'];

          final detailResponse = await http.get(
            Uri.parse(
                '${DjangoConstants.backendBaseUrl}/equality/header-berita-acara/$beritaId/combined-detail/'),
          );

          if (detailResponse.statusCode == 200) {
            final Map<String, dynamic> detailedData =
                json.decode(detailResponse.body);

            final attendanceResponse = await http.get(
              Uri.parse(
                  '${DjangoConstants.backendBaseUrl}/equality/header-berita-acara/$beritaId/detail-berita-acara/'),
            );

            if (attendanceResponse.statusCode == 200) {
              final List<dynamic> attendanceData =
                  json.decode(attendanceResponse.body);
              
              // Fetch name for user
            final userId = detailedData['preparations']['user_id'];
            print('user id : $userId');
            final userResponse = await http.get(
              Uri.parse('${DjangoConstants.backendBaseUrl}/api/user_s/$userId/'),
            );
            final Map<String, dynamic> userData = json.decode(userResponse.body);
            final userName = userData['first_name'];

              detailedData['user_name'] = userName;
              detailedData['attendance'] = attendanceData;
            }

            setState(() {
              items.add(detailedData);
              items.sort((a, b) => b['id'].compareTo(a['id']));
            });
          } else {
            throw Exception('Failed to load detailed data for ID: $beritaId');
          }
        }
      } else {
        // Handle the case where the list is empty
        print('No data available');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: CustomAppBar(
        title: 'List Berita Acara',
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // Apply filters to the list
                  if (selectedFilters.isNotEmpty &&
                      !selectedFilters.contains(items[index]['item'])) {
                    return Container(); // Return an empty container if the item is not selected
                  }
                  // Display the item within a Container
                  return Container(
                    // Apply styling or additional properties here
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: ListTile(
                      //leading:
                      subtitle: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(items[index]
                                        ['image'] ??
                                    'assets/image/mattew.jpeg'),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /**Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 4,bottom: 4,right: 8,left: 8),
                                        decoration: BoxDecoration(
                                          //border: Border.all(color: const Color.fromARGB(255, 195, 195, 195)),
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: getStatusColor(items[index]['status']), // Set background color based on status
                                        ),
                                        
                                        child: Row(
                                          children: [
                                            getStatusIcon(items[index]['status']),
                                            const SizedBox(width: 8),
                                            Text(
                                              '${items[index]['status']}',
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),**/
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                        child: Text(
                                          'ID : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          '${items[index]['id']}',
                                          style: const TextStyle(
                                              color: Color(0xFF8696BB)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      '${items[index]['kegiatan']}',
                                      style: const TextStyle(
                                          color: Color(0xFF8696BB)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 0.5,
                            color: const Color(0xFF8696BB),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      height: 15,
                                      width: 15,
                                      child:
                                          Image.asset("assets/image/date.png")),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${items[index]['preparations']['time_at']}',
                                    style: const TextStyle(
                                        color: Color(0xFF8696BB)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset(
                                          "assets/image/pekerja.png")),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${items[index]['user_name']}',
                                    style: const TextStyle(
                                        color: Color(0xFF8696BB)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                                              BeritaAcaraDetailPage(item: items[index])),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 255, 255, 255)),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0), // Set your desired border radius
                                        side: const BorderSide(
                                            color: Color.fromARGB(255, 219, 11,
                                                11)), // Set your desired border color
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Detail',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 219, 11, 11)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CommentPage()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromARGB(255, 219, 11, 11)),
                                  ),
                                  child: const Text(
                                    'Comment',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Add more properties as needed
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: BubbleButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BeritaAcaraFormPage(
                        username: loggedInUsername,
                      )));
        },
      ),
    ));
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Approved SEM':
        return const Color(0xFF07864B);
      case 'Draft':
        return const Color(0xFF646464);
      case 'Rejected':
        return const Color(0xFFEB1D24);
      case 'Inreview':
        return const Color(0xFF211DEB);
      default:
        return Colors.grey;
    }
  }

  Icon getStatusIcon(String status) {
    switch (status) {
      case 'Approved SEM':
        return const Icon(Icons.check_circle, color: Colors.white, size: 15);
      case 'Draft':
        return const Icon(Icons.drafts, color: Colors.white, size: 15);
      case 'Rejected':
        return const Icon(Icons.error, color: Colors.white, size: 15);
      case 'Inreview':
        return const Icon(Icons.timer, color: Colors.white, size: 15);
      default:
        return const Icon(Icons.close, color: Colors.white, size: 15);
    }
  }
}
