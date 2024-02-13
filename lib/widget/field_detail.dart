import 'package:flutter/material.dart';

class FieldDetailWidget extends StatelessWidget {
  final String label;
  final dynamic value;
  final String? suffix;

  const FieldDetailWidget({
    Key? key,
    required this.label,
    required this.value,
    this.suffix, // Buat parameter suffix menjadi opsional
  }) : super(key: key);

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
        const SizedBox(height: 5,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  if (suffix != null) // Tambahkan kondisi untuk menampilkan suffix jika tidak null
                    Text(
                      suffix!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
