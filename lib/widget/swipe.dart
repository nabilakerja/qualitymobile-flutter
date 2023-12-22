import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Toggle Switch Example'),
        ),
        body: Center(
          child: MyToggleSwitch(),
        ),
      ),
    );
  }
}

class MyToggleSwitch extends StatefulWidget {
  @override
  _MyToggleSwitchState createState() => _MyToggleSwitchState();
}

class _MyToggleSwitchState extends State<MyToggleSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Switch State: ${isSwitched ? 'ON' : 'OFF'}',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 20.0),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
      ],
    );
  }
}
