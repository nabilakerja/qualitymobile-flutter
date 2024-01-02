// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DropdownIconKondisiBaikWidget extends StatelessWidget {
  String? selectedValue;
  final String hintText;
  final void Function(String?) onChanged;
  final String label;

  DropdownIconKondisiBaikWidget({super.key, 
    required this.onChanged,
    required this.hintText,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text(hintText),
                  value: selectedValue,
                   items: [
                    'Kondisi baik',
                    'Kondisi Tidak Baik',
                    ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: onChanged,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  isExpanded: true,
                ),
              ),
            ),
            const SizedBox(width: 8), // Add some space between dropdown and icon
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                // Handle camera icon click
              },
            ),
          ],
        ),
        const SizedBox(height: 5,)
      ],
    );
  }
}

class DropdownIconKondisiBerfungsiWidget extends StatelessWidget {
  String? selectedValue;
  final String hintText;
  final void Function(String?) onChanged;
  final String label;

  DropdownIconKondisiBerfungsiWidget({super.key, 
    required this.onChanged,
    required this.hintText,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text(hintText),
                  value: selectedValue,
                   items: [
                    'Kondisi baik dan Berfungsi',
                    'Kondisi tidak baik dan tidak Berfungsi'
                    ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: onChanged,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  isExpanded: true,
                ),
              ),
            ),
            const SizedBox(width: 8), // Add some space between dropdown and icon
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                // Handle camera icon click
              },
            ),
          ],
        ),
        const SizedBox(height: 5,)
      ],
    );
  }
}
