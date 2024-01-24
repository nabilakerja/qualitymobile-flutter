import 'package:flutter/material.dart';

class ThreeFieldsWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  final TextEditingController? controller3;
  final ValueChanged<double>? onSubmitted1;
  final ValueChanged<double>? onSubmitted2;

  // Add this line

  const ThreeFieldsWithLabel({super.key, 
    required this.label,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    this.onSubmitted1,
    this.onSubmitted2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 70,
              padding: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
                      child: Text(
                        label,
                      )),
            const SizedBox(width: 20,),
            Expanded(
              child: Container(
                width: 85,
                height: 60,
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: controller1,
                  onSubmitted: (value) {
                    if (onSubmitted1 != null) {
                      onSubmitted1!(double.parse(value));
                    }
                  },
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 78, 78, 78)))),
                ),
              ),
            ),
            const SizedBox(width: 5),
            const SizedBox(
                width:
                    5), // Add some spacing between the text fields and the icon
            Expanded(
              child: Container(
                width: 85,
                height: 60,
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: controller2,
                  onSubmitted: (value) {
                    if (onSubmitted2 != null) {
                      onSubmitted2!(double.parse(value));
                    }
                  },
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 78, 78, 78)))),
                ),
              ),
            ),
            const SizedBox(width: 5),
            const SizedBox(
                width:
                    5), // Add some spacing between the text fields and the icon
            Expanded(
              child: Container(
                width: 85,
                height: 60,
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: controller3,
                  enabled: false,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 78, 78, 78)),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 78, 78, 78))
                              ),
                              filled: true, // Enable background fill
                    fillColor: Color.fromARGB(255, 177, 177, 177), // Background color
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
