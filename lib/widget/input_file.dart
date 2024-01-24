// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

Widget inputFile<T>({
  label,
  obscureText = false,
  suffixText,
  TextEditingController? controller,
  String? initialValue,
  bool enabled = true,
  bool readOnly = false,
  void Function(double)? onSubmitted, // Optional onSubmitted callback
  Color? backgroundColor,
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
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: TextField(
          //textAlign: TextAlign.center,
          controller: controller,
          obscureText: obscureText,
          enabled: enabled && !readOnly, // Consider readOnly when enabling the field
          readOnly: readOnly, // Set readOnly property
          onSubmitted: onSubmitted != null
              ? (String value) {
                  // Attempt to parse the input as an int
                  try {
                    double floatValue = double.tryParse(value) ?? 0.0;
                    onSubmitted(floatValue);
                  } catch (e) {
                    // Handle the case where the input is not a valid int
                    print("Invalid input. Please enter a valid integer.");
                  }
                }
              : null,
          decoration: InputDecoration(
            labelText: initialValue?.toString(),
            suffixText: suffixText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
            ),
          ),
        ),
      ),
      const SizedBox(height: 5,)
    ],
  );
}
