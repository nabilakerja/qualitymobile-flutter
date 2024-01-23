// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/approval.dart';
import 'package:hki_quality/screens/dashboard.dart';
import 'package:hki_quality/screens/home_page.dart';
import 'package:hki_quality/screens/profile.dart';
import 'package:hki_quality/screens/spectech.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(), // Add this line to include the body
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(235, 0, 20, 151),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Color.fromARGB(235, 211, 14, 14)),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Handle navigation when a tab is clicked
            _navigateToScreen(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, size: 24),
            label: 'SpecTech',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, size: 24),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.approval_sharp, size: 24),
            label: 'Approval',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp, size: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Build the body based on the selected tab
  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return HomeView(); 
      case 1:
        return const SpectechPage(); 
      case 2:
        return const Dashboard(); 
      case 3:
        return const Approval(); 
      case 4:
        return const Profile(); 
      default:
        return Container(); // Add a default case or return an empty container
    }
  }

  // Navigate to the appropriate screen based on the selected tab
  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        // No need to navigate here as the body is already updated in _buildBody
        break;
      
    }
  }
}