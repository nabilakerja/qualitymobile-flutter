import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/aspal_curah/softeningpoint.dart';
import 'package:hki_quality/aspal/menu.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/title_custom_button.dart';

class HeaderAspalCurahFormPage extends StatefulWidget {
  @override
  _HeaderAspalCurahFormPageState createState() => _HeaderAspalCurahFormPageState();
}

class _HeaderAspalCurahFormPageState extends State<HeaderAspalCurahFormPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pengujian Aspal Curah',
        
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Row(
                      children:  <Widget>[
                        Image.asset('assets/image/calendar.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: 
                              const Text(
                                "formatDate()",
                                ),),                           
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          "Location()"),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/image/location.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,),
                        ),               
                      ],),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x7CFFE0E0),
                      borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
                      border: Border.all(
                        color: const Color(0x79F61118),
                        width: 2.0,
                      ),
                    ),
                    //padding: EdgeInsets.only(top: 10, bottom: 10),
                    height: 54,
                    width: 400,
                    child:
                      Column(mainAxisAlignment: MainAxisAlignment.start, 
                      children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors:[Color(0xFFFF0000),Color.fromARGB(255, 0, 0, 0)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3.0),
                                  topRight: Radius.circular(0.0),
                                  bottomLeft: Radius.circular(3.0),
                                  bottomRight: Radius.circular(0.0),),
                              ),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/image/building.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                                //color: const Color.fromARGB(255, 255, 0, 0)
                                ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: SizedBox(height: 12.0),
                          ),
                          const Text("Pangkalan Binjai",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14.0,
                                  ))
                    ])],
                      ),
                        ),
                ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Sta. Pengujian"),
                              inputFile(label: "Tanggal Pengambilan Sampel"),
                              inputFile(label: "Tanggal Pengujian"),
                              inputFile(label: "Tipe Sampel"),
                              inputFile(label: "Lokasi AMP")
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: "Penetration Test"),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Sample is heated"),
                              inputFile(label: "Sample is cured at room temperature"),
                              inputFile(label: "Sample is soaked at 5 derajat celcius"),
                              inputFile(label: "Softening Point test At 5 derajat celcius"),
                              inputFile(label: "Waterbath Temp",suffixText: "C"),
                              inputFile(label: "Equipment Temp",suffixText: "C")
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: "Specimen Code"),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              MaterialButton(onPressed: () {_showAddItemDialog(context);
                              },child: Image.asset("assets/image/plus.png"),
                              )
                              
                          ]),
                        ),
                        const SizedBox(height: 10.0), // Add some spacing
                        Container(
                          padding: EdgeInsets.only(left: 40,right: 40),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black), // Add border to DataTable
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('Detik Ke-')),
                              DataColumn(label: Text('Specimen Code')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('Row 1, Col 1')),
                                DataCell(Text('Row 1, Col 2')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Row 2, Col 1')),
                                DataCell(Text('Row 2, Col 2')),
                              ]),
                              // Add more DataRow entries as needed
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CustomTitleButton(
                            title: 'Softening Point Test',
                            onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SofteningFormPage()));
                                        },
                            ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 15),
                          child: 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Upload a file",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                        ),),
                                        const Text("Image upload description",
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 12,
                                                ),),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.only(top: 15),
                                                  child: Column(
                                                    children: [
                                                      Image.asset("assets/image/upload.png")
                                                  ]),
                                                )
                              ],
                            ),),
                        const SizedBox(height: 16.0), // Add some spacing
                        CustomTextButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuAspal()));
                              },
                          text: 'Submit',
                        ),
            ]),),),),
    );
  }

Future<void> _showAddItemDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Specimen Code'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField('Detik Ke-'),
                _buildInputField('Specimen Code'),
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
}