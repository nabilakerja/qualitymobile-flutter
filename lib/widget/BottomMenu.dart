import 'package:flutter/material.dart';


class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Color.fromARGB(235, 211, 14, 14), // Set the color for the selected item
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(color: Color.fromARGB(235, 211, 14, 14),), // Label color for selected item
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Icon(Icons.home),
              ),
            ],
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Icon(Icons.book),
              ),
            ],
          ),
          label: 'SpecTech',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Icon(Icons.dashboard),
              ),
            ],
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Icon(Icons.approval),
              ),
            ],
          ),
          label: 'Approval',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Icon(Icons.account_circle_sharp),
              ),
            ],
          ),
          label: 'Profile',
        ),
      ],
    );
  }

}