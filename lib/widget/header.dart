import 'package:flutter/material.dart';

class CustomInfoCard extends StatelessWidget {
  final String dateText;
  final String locationText;
  final String text;

  const CustomInfoCard({super.key, 
    required this.dateText,
    required this.locationText,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/image/calendar.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        dateText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(locationText),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'assets/image/location.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x7CFFE0E0),
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: const Color(0x79F61118),
                width: 2.0,
              ),
            ),
            height: 54,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF0000), Color.fromARGB(255, 0, 0, 0)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.0),
                          topRight: Radius.circular(0.0),
                          bottomLeft: Radius.circular(3.0),
                          bottomRight: Radius.circular(0.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/image/building.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: SizedBox(height: 12.0),
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
