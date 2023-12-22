import 'package:flutter/material.dart';

class CustomTitleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  CustomTitleButton({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Color(0xFF334A9F),Color.fromARGB(255, 0, 0, 0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            ),),
            height: 50,
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white, // Set the text color
                    ),
                    ),
                    Image.asset("assets/image/arrowdown.png",
                                width: 17,
                                height: 17,
                                fit: BoxFit.cover,
                                //color: const Color.fromARGB(255, 255, 0, 0)
                                ),
              ],
            ),
                ),
    );
  }
}

