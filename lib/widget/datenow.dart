// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class DateNow extends StatelessWidget {
  const DateNow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Date and Location Example'),
        ),
        body: const Center(
          child: DateAndLocationWidget(),
        ),
      ),
    );
  }
}

class DateAndLocationWidget extends StatefulWidget {
  const DateAndLocationWidget({super.key});

  @override
  _DateAndLocationWidgetState createState() => _DateAndLocationWidgetState();
}

class _DateAndLocationWidgetState extends State<DateAndLocationWidget> {
  String currentDate = "";
  String currentLocation = "";

  @override
  void initState() {
    super.initState();
    _getCurrentDate();
    _getCurrentLocation();
  }

  Future<void> _getCurrentDate() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    setState(() {
      currentDate = formattedDate;
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        currentLocation =
            "Lat: ${position.latitude}, Long: ${position.longitude}";
      });
    } catch (e) {
      setState(() {
        currentLocation = "Error getting location: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Today's Date: $currentDate"),
        const SizedBox(height: 20),
        Text("Current Location: $currentLocation"),
      ],
    );
  }
}