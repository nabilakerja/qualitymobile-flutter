import 'package:flutter/material.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Akun Saya',
        
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 20),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius:BorderRadius.circular(100),
                child: const Image(image: AssetImage('assets/image/mattew.jpeg')),
              ),
            ),
            const SizedBox(height: 25,),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile(username: loggedInUsername),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000), side: BorderSide.none, shape: const StadiumBorder()
                ),
                child: const Text("Detail Profile", style: TextStyle(color: Colors.white),) ),
            ),
            const SizedBox(height: 30,),
            MenuProfile(title: "Ubah Kata Sandi", icon: Icons.key, onPressed: (){},),
            const SizedBox(height: 5,),
            MenuProfile(title: "Bantuan", icon: Icons.favorite_border, onPressed: (){},),
            const SizedBox(height: 5,),
            MenuProfile(title: "Tentang Kami", icon: Icons.info_outline, onPressed: (){},),
            const SizedBox(height: 30,),
            MenuProfile(title: "Keluar", icon: Icons.logout, endIcon: false, onPressed: (){
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
            },),
          ],
        ),
      )
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
          child: Icon(icon,color: const Color.fromARGB(255, 7, 0, 216),),
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

