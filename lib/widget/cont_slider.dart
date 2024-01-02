import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class CustomContainerSlider extends StatelessWidget {
  final String text;

  const CustomContainerSlider({super.key, 
    required this.text,
  });

  @override
  
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(5),
            padding: const EdgeInsets.all(6),
            color: Colors.black,
            strokeWidth: 1,
            child: Container(
              padding: const EdgeInsets.only(right: 10,left: 10),
              width: 370,
              height: 50,
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          child: Text(
                            text),
                        ),
                        const Text(
                          'Yes',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),),
                        
                        const Text(
                          'No',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/image/iconupload.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,),
                        ),               
                      ],),
              )
            ),
          );
  }
}
