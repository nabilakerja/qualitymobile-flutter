import 'package:flutter/material.dart';


class TwoFieldsWithLabel extends StatelessWidget {
  final String label;

  TwoFieldsWithLabel({required this.label});

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
              decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78))),
            ),
              ),
            ),
            Expanded(child: Icon(
            Icons.add,
            size: 25.0, // Ubah ukuran ikon sesuai kebutuhan Anda
          ),),
            Expanded(
              child: TextField(
              decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78))),
            ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5,)
      ],
    );
  }
}