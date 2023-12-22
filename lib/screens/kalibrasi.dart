import 'package:flutter/material.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/soil/document.dart';

class Kalibrasi extends StatelessWidget {
  const Kalibrasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalibrasi'),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Kalibrasi Pasir dan Tabung Alat Sandcone',
                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      ) ),
              ),
            Text(
                '((Khusus pengujian sandcone))',
                textAlign: TextAlign.left,
                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    ) ),
            Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Rata-rata berat isi pasir (y')",suffixText: "gr/cm3"),
                            ],
                          ),
                        ),
            Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      MaterialButton(onPressed: () {_showAddItemDialog(context);
                      },child: Image.asset("assets/image/plus.png"),
                      )
                      
                  ]),
                ),
            SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DocumentPage()));
                              },
                  text: 'Submit',
                  ),
                        ],
          ),                      
        ),),
    );
  }
}
Widget inputFile({label, obscureText = false, suffixText})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical:2),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
              suffixText: suffixText ,
              contentPadding: EdgeInsets.symmetric(vertical: 0,
                  horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 78, 78, 78)
                ),
        
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color.fromARGB(255, 78, 78, 78))
              )
          ),
        ),
      ),
      SizedBox(height: 5,)
    ],
  );
}
Future<void> _showAddItemDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kalibrasi'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField('Corong'),
                _buildInputField('Rata-rata berat pasir '),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Add your logic for saving the data here
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without saving
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Helper function to build input fields
  Widget _buildInputField(String labelText) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }