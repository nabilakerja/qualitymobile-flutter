import 'package:flutter/material.dart';

Widget inputFile({
  label, 
  obscureText = false, 
  suffixText,
  TextEditingController? controller,
  String? initialValue,
  bool enabled = true
  }) {
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
      Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: TextField(
          controller: controller, 
          obscureText: obscureText,
          enabled: enabled,
          
          decoration: InputDecoration(
            labelText: initialValue,
            suffixText: suffixText,
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
      const SizedBox(height: 5,)
    ],
  );
}
