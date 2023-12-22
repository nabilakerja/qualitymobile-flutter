import 'package:flutter/material.dart';
import 'package:hki_quality/screens/welcome.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => Welcome(),
          ),
          (route) => false);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/splash.png', width: 200, height: 200),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}