import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class SpecTech extends StatefulWidget {
  @override
  _SpecTechState createState() => _SpecTechState();
}

class _SpecTechState extends State<SpecTech> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SpecTech',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
            ]),),),),
    );
  }
}
