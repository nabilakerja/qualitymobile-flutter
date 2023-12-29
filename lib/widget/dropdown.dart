import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final String hintText;
  final void Function(String?) onChanged;
  final String label;

  DropdownWidget({
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.hintText,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            hint: Text(hintText),
            value: selectedValue,
            items: items.map((String value) {
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
        const SizedBox(height: 5,)
      ],
    );
  }
}
