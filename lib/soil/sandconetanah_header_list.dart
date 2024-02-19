// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/comment.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/soil/sandconetanah_header.dart';
import 'package:hki_quality/soil/sandconetanah_header_det.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/bubblebutton.dart';
import 'package:http/http.dart' as http;

class ListSandconeTanahHeader extends StatefulWidget {
  const ListSandconeTanahHeader({super.key});

  @override
  _ListSandconeTanahHeaderState createState() =>
      _ListSandconeTanahHeaderState();
}

class _ListSandconeTanahHeaderState extends State<ListSandconeTanahHeader> {
  List<dynamic> items = [];
  List<Map<String, dynamic>> testings = [];
  List<String> selectedFilters = [];
  late int sandconeheaderId;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('${DjangoConstants.backendBaseUrl}/equality/sandcones/'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);

      if (decodedData.isNotEmpty) {
        for (final Map<String, dynamic> item in decodedData) {
          sandconeheaderId = item['id'];

          final detailResponse = await http.get(
            Uri.parse(
                '${DjangoConstants.backendBaseUrl}/equality/sandcones/$sandconeheaderId/combined-detail/'),
          );

          print(detailResponse.body);
          if (detailResponse.statusCode == 200) {
            final Map<String, dynamic> detailedData =
                json.decode(detailResponse.body);

            // Fetch name for activity
            final worktypeId = detailedData['testings']['work_types_id'];
            print('worktype id : $worktypeId');
            final activityResponse = await http.get(
              Uri.parse(
                  '${DjangoConstants.backendBaseUrl}/equality/api/worktype/$worktypeId/'),
            );
            final Map<String, dynamic> worktypeData =
                json.decode(activityResponse.body);
            final worktypeName = worktypeData['name'];

            // Fetch name for user
            final userId = detailedData['testings']['user_id'];
            print('user id : $userId');
            final userResponse = await http.get(
              Uri.parse('${DjangoConstants.backendBaseUrl}/api/user_s/$userId/'),
            );
            final Map<String, dynamic> userData = json.decode(userResponse.body);
            final userName = userData['first_name'];

            detailedData['user_name'] = userName;

            // Fetch name for work type
            /**final workTypeId = detailedData['testings']['work_types_id'];
          final workTypeResponse = await http.get(
            Uri.parse('${DjangoConstants.backendBaseUrl}/equality/worktype/$workTypeId/'),
          );
          final Map<String, dynamic> workTypeData = json.decode(workTypeResponse.body);
          final workTypeName = workTypeData['name'];**/

            detailedData['activity_name'] = worktypeName;
            //detailedData['work_type_name'] = workTypeName;

            setState(() {
              items.add(detailedData);
              items.sort((a, b) => b['id'].compareTo(a['id']));
            });
          } else {
            throw Exception(
                'Failed to load detailed data for ID: $sandconeheaderId');
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
          title: 'Pengujian Pekerjaan Sandcone Tanah',
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'STA ${items[index]['testings']['sta_start']} + ${items[index]['testings']['sta_to']}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${items[index]['activity_name']}',
                                      style: const TextStyle(
                                          color: Color(0xFF8696BB)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    /**Text('${items[index]['work_type_name']}',
  style: const TextStyle(color: Color(0xFF8696BB)),
),**/
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
                                        child: Image.asset(
                                            "assets/image/date.png")),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${items[index]['testings']['time_at']}',
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
                                                SandconeTanahDetailPage(
                                                    item: items[index],
                                                    sandconeId:
                                                        sandconeheaderId)),
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
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 219, 11, 11)),
                                        ),
                                      ),
                                    ),
                                    child: const Text('Detail',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 219, 11, 11))),
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
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 219, 11, 11)),
                                    ),
                                    child: const Text('Comment',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255))),
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
        floatingActionButton: BubbleButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SandconeHeaderPage(username: loggedInUsername)));
          },
        ),
      ),
    );
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
