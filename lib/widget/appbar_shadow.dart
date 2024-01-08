// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class AppBarWithShadow extends StatelessWidget {
  final String title;

  const AppBarWithShadow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AppBar(
        title: Text(title),
      ),
    );
  }
}
