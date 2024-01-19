// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CustomInfoCard extends StatefulWidget {
  final String locationText;
  final String username;

  const CustomInfoCard({
    super.key,
    required this.locationText,
    required this.username,
  });

  @override
  _CustomInfoCardState createState() => _CustomInfoCardState();
}

class _CustomInfoCardState extends State<CustomInfoCard> {
  late Future<Map<String, dynamic>> userData;

  @override
  void initState() {
    super.initState();
    userData = fetchUserData(widget.username);
  }
  Future<Map<String, dynamic>> fetchUserData(String username) async {
  try {
    final response = await http.get(
      Uri.parse('${DjangoConstants.backendBaseUrl}/api/profile/$username/'),
    );
    //print('header: $username');
    if (response.statusCode == 200) {
      dynamic responseBody = jsonDecode(response.body);
      //print('respon apa ini : $responseBody');

      if (responseBody is Map<String, dynamic>) {
        // If the response is a map, handle it as expected
        Map<String, dynamic> user = responseBody;
        //firstNameController.text = user['first_name'];
        //lastNameController.text = user['last_name'];
        return user;
      } else if (responseBody is List<dynamic> && responseBody.isNotEmpty) {
        // If the response is a list, you might need to handle it differently
        // For example, you can return the first item in the list
        Map<String, dynamic> user = responseBody[0];
        //firstNameController.text = user['first_name'];
        //lastNameController.text = user['last_name'];
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: userData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          Map<String, dynamic> userData = snapshot.data!;
          DateTime now = DateTime.now();
          String formattedDate = DateFormat.yMMMMd('en_US').format(now);
          String userProject = userData['project'] ?? 'Default Project';

          return _buildInfoCard(widget.locationText, formattedDate, userProject);
        }
      },
    );
  }

  Widget _buildInfoCard(String locationText, String formattedDate, String userProject) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/image/calendar.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        formattedDate,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(locationText),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'assets/image/location.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x7CFFE0E0),
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: const Color(0x79F61118),
                width: 2.0,
              ),
            ),
            height: 54,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF0000), Color.fromARGB(255, 0, 0, 0)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.0),
                          topRight: Radius.circular(0.0),
                          bottomLeft: Radius.circular(3.0),
                          bottomRight: Radius.circular(0.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/image/building.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: SizedBox(height: 12.0),
                    ),
                    Text(
                      userProject,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}