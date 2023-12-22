import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CustomTextButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: onPressed,
                    color: const Color.fromARGB(255, 219, 11, 11),
                    // defining the shape
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 219, 11, 11),
                      ),
                      //borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  );

  }
}

