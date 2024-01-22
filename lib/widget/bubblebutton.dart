import 'package:flutter/material.dart';

class BubbleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BubbleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          FloatingActionButton(
            enableFeedback: true,
            onPressed: onPressed,
            backgroundColor: const Color.fromARGB(235, 211, 14, 14),
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color : Color.fromARGB(255, 255, 255, 255)),
          ),
          const Positioned(
            right: 15.0,
            bottom: 15.0,
            child: SizedBox(
              width: 20.0,
              height: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
