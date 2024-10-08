import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hki_quality/screens/comment.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/soil/approval_material.dart';
import 'package:hki_quality/soil/approval_material_detail.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/bubblebutton.dart';
import 'package:http/http.dart' as http;

class ListApprovalMaterialSoil extends StatefulWidget {
  @override
  _ListApprovalMaterialSoilState createState() =>
      _ListApprovalMaterialSoilState();
}

class _ListApprovalMaterialSoilState extends State<ListApprovalMaterialSoil> {
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
      Uri.parse('${DjangoConstants.backendBaseUrl}/equality/tanah-material/'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);

      if (decodedData.isNotEmpty) {
        for (final Map<String, dynamic> item in decodedData) {
          final materialId = item['id'];

          final detailResponse = await http.get(
            Uri.parse(
                '${DjangoConstants.backendBaseUrl}/equality/tanah-material/$materialId/combined-detail/'),
          );

          print(detailResponse.body);
          if (detailResponse.statusCode == 200) {
            final Map<String, dynamic> detailedData =
                json.decode(detailResponse.body);

            // Fetch name for Project
            final projectId = detailedData['preparations']['project'];
            print('project id : $projectId');
            final activityResponse = await http.get(
              Uri.parse(
                  '${DjangoConstants.backendBaseUrl}/api/project/$projectId/'),
            );
            final Map<String, dynamic> projectData =
                json.decode(activityResponse.body);
            final projectName = projectData['name'];

            // Fetch name for user
            final userId = detailedData['preparations']['user_id'];
            print('user id : $userId');
            final userResponse = await http.get(
              Uri.parse('${DjangoConstants.backendBaseUrl}/api/user_s/$userId/'),
            );
            final Map<String, dynamic> userData = json.decode(userResponse.body);
            final userName = userData['first_name'];

            detailedData['project_name'] = projectName;
            detailedData['user_name'] = userName;

            setState(() {
              items.add(detailedData);
              items.sort((a, b) => b['id'].compareTo(a['id']));
            });
          } else {
            throw Exception('Failed to load detailed data for ID: $materialId');
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
        title: 'Approval Material Pekerjaan Tanah',
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Asal Material : ${items[index]['asal_material']}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      /**Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 4,
                                                bottom: 4,
                                                right: 8,
                                                left: 8),
                                            decoration: BoxDecoration(
                                              //border: Border.all(color: const Color.fromARGB(255, 195, 195, 195)),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: getStatusColor(items[index]
                                                  [
                                                  'status']), // Set background color based on status
                                            ),
                                            child: Row(
                                              children: [
                                                getStatusIcon(
                                                    items[index]['status']),
                                                const SizedBox(width: 8),
                                                Text(
                                                  '${items[index]['status']}',
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),**/
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${items[index]['project_name']}',
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
                                    // Add logic to navigate to the detail page
                                    // You can pass the item details to the detail page if needed
                                    // For example:
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(item: item)));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ApprovalMaterialDetailPage(
                                                item: items[index]),
                                      ),
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
                  builder: (context) => ApprovalMaterialTestFormPage(
                      username: loggedInUsername)));
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
