import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserProfile(),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Account',
        
      ),
      body: Column(
        children: [
          Card(
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Set your desired radius here
                    ),
                    child: Container(
          height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 2, 72, 213),
                  Color.fromARGB(255, 248, 0, 0), // Adjust colors as needed
                ],
              ),
            ),
                    child: ListTile(
          contentPadding: const EdgeInsets.only(left: 7,right: 7,top: 10),
          leading: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user_avatar.jpg'),
              ),
          title: const Text(
                'Imam Syahir',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
          subtitle: const Text(
                'Laboratorium',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            trailing: IconButton(
            icon: const Icon(Icons.edit,color: Color.fromRGBO(255, 255, 255, 1),), // You can use any download icon
            onPressed: () {
              // Add your download logic here
            },
          ),
                    ),
            ),
                    ),
        ],
      )
    );
  }
}
