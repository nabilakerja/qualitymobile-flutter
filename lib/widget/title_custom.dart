// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;

  CustomTitle({super.key, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors:[Color(0xFFFF0000),Color.fromARGB(255, 0, 0, 0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          ),),
          height: 35,
          width: 400,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white, // Set the text color
              ),
              ),
              );
  }
}

