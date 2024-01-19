import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomContainerSliderController extends ChangeNotifier {
  bool _isSwitched = false;

  bool get isSwitched => _isSwitched;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }
}

class CustomContainerSlider2 extends StatelessWidget {
  final String text;
  final CustomContainerSliderController controller;

  const CustomContainerSlider2({
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
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 30.0,
                    minHeight: 25.0,
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
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/image/iconupload.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        'Drop your file here',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
