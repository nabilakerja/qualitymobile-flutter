// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hki_quality/widget/appbar_theme.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required this.username});

  final String username;

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<Map<String, dynamic>> userData;
  //TextEditingController firstNameController = TextEditingController();
  //TextEditingController lastNameController = TextEditingController();

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
    print('header: $username');
    if (response.statusCode == 200) {
      dynamic responseBody = jsonDecode(response.body);
      print('respon: $responseBody');

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


  /**Future<void> updateUserProfile() async {
    try {
      final response = await http.put(
        Uri.parse('${DjangoConstants.backendBaseUrl}/api/users/${widget.username}/'),
        body: jsonEncode({
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Handle successful update, maybe fetch and display updated user data
        setState(() {
          userData = fetchUserData(widget.username);
        });
      } else {
        throw Exception('Failed to update user data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating user data: $error');
      // Handle error accordingly
    }
  }**/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Akun Saya',
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('No data available.');
          } else {
            Map<String, dynamic> user = snapshot.data!;

            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    _buildProfileField("Nama Lengkap", "${user['first_name']} ${user['last_name']}"),
                    const SizedBox(height: 15),
                    _buildProfileField("Alamat Email", user['email']),
                    const SizedBox(height: 15),
                    _buildProfileField("Perusahaan", user['company']),
                    const SizedBox(height: 15),
                    _buildProfileField("Jabatan", user['position']),
                    const SizedBox(height: 15),
                    _buildProfileField("Atasan Langsung", user['direct_supervisor']),
                    const SizedBox(height: 15),
                    _buildProfileField("Project", user['project']),
                    const SizedBox(height: 15),
                    _buildProfileField("Ruas", user['ruas']),
                    const SizedBox(height: 15),
                    _buildProfileField("Seksi", user['seksi']),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        const SizedBox(height: 5,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.circular(8),
            
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DjangoConstants {
  static const String backendBaseUrl = 'http://10.0.2.2:8000';
}
