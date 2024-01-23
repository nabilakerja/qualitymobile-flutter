// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomContainerController extends ChangeNotifier {
  bool _isSwitched = true;

  bool get isSwitched => _isSwitched;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }
}

class CustomContainerSlider extends StatelessWidget {
  final String text;
  final CustomContainerController controller;

  const CustomContainerSlider({
    super.key,
    required this.text,
    required this.controller,
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
            padding: const EdgeInsets.only(right: 10, left: 10),
            width: 370,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  child: Text(text),
                ),
                const Text(
                  'No',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ToggleSwitch(
                  minWidth: 30.0,
                  minHeight: 27.0,
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [Colors.redAccent],
                    [Color.fromARGB(255, 131, 219, 59)],
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  onToggle: (index) {
                      // Call the toggleSwitch method on the controller
                      controller.toggleSwitch(index == 0);
                    },
                ),
                const Text(
                  'Yes',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'assets/image/iconupload.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
