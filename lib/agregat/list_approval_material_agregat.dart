import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class ListApprovalMaterialAgregat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
        title: 'Approval Material Agregat A',
        
      ),
        body: Center(
          child: SelectionDropdown(),
        ),
      ),
    );
  }
}

class SelectionDropdown extends StatefulWidget {
  @override
  _SelectionDropdownState createState() => _SelectionDropdownState();
}

class _SelectionDropdownState extends State<SelectionDropdown> {
  String selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
      child: Column(
        children: [
          Text('Type Agregat'),
          SizedBox(height: 50),
          DropdownButton<String>(
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
              });
            },
            items: <String>['Agregat A', 'Agregat B', 'Agregat DL', 'Agregat GB']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
