// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:http/http.dart' as http;

String? profilePictureUrl; // New variable to hold the profile picture URL

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? profilePictureUrl;

  @override
  void initState() {
    super.initState();
    loadProfilePicture();
  }

  Future<void> loadProfilePicture() async {
    try {
      // Replace 'YOUR_BACKEND_BASE_URL' with your Django backend base URL
      final response = await http.get(Uri.parse(
          '${DjangoConstants.backendBaseUrl}/api/profile_picture/$loggedInUsername'));
      print(profilePictureUrl);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          profilePictureUrl = data['profile_picture'];
        });
      } else {
        // Handle error response
        print(
            "Failed to load profile picture. Status code: ${response.statusCode}");
      }
    } catch (error) {
      // Handle network or other errors
      print("Error loading profile picture: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ClipOval(
              child: SizedBox(
                width: 120.0,
                height: 120.0,
                child: profilePictureUrl != null
                    ? Image.network(profilePictureUrl!, fit: BoxFit.cover)
                    : const Image(
                        image: AssetImage('assets/image/mattew.jpeg'),
                        fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UserProfile(username: loggedInUsername),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000),
                  side: BorderSide.none,
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  "Detail Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            MenuProfile(
                title: "Ubah Kata Sandi", icon: Icons.key, onPressed: () {}),
            const SizedBox(height: 5),
            MenuProfile(
                title: "Bantuan",
                icon: Icons.favorite_border,
                onPressed: () {}),
            const SizedBox(height: 5),
            MenuProfile(
                title: "Tentang Kami",
                icon: Icons.info_outline,
                onPressed: () {}),
            const SizedBox(height: 30),
            MenuProfile(
              title: "Keluar",
              icon: Icons.logout,
              endIcon: false,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.endIcon = true,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
      ),
      child: ListTile(
        onTap: onPressed,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(255, 7, 0, 216).withOpacity(0.1),
          ),
          child: Icon(icon, color: const Color.fromARGB(255, 7, 0, 216)),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFF0700D8).withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color.fromARGB(255, 7, 0, 216),
                ),
              )
            : null,
      ),
    );
  }
}
