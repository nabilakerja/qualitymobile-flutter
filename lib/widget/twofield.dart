import 'package:flutter/material.dart';

class TwoFieldsWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController? controller1; 
  final TextEditingController? controller2;
  // Add this line

  const TwoFieldsWithLabel({super.key, 
   
    required this.label, 
    required this.controller1,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller1,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5), // Add some spacing between the text fields and the icon
            const Icon(
              Icons.add,
              size: 25.0, // Change the icon size as needed
            ),
            const SizedBox(width: 5), // Add some spacing between the text fields and the icon
            Expanded(
              child: TextField(
                controller:  controller2,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
