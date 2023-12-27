import 'package:flutter/material.dart';
import 'package:hki_quality/rigid/menu.dart';
import 'package:hki_quality/rigid/pengujian_detail.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';

class TestingHeaderPage extends StatefulWidget {
  @override
  _TestingHeaderPageState createState() => _TestingHeaderPageState();
}

class _TestingHeaderPageState extends State<TestingHeaderPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pengujian Pekerjaan Rigid',
        
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
                                ),),],),
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
                    //color: Color.fromRGBO(2, 9, 56, 0.498),
                    //color: selectedFood == foodName
                      // ? Color.fromARGB(255, 66, 212, 100)
                        //: Colors.transparent,
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
                        ),),
                Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Tanggal Pengecoran"),
                              inputFile(label: "Kelas Beton"),
                              inputFile(label: "Fs/Fc"),
                              inputFile(label: "Sampel Beton"),
                              inputFile(label: "Batching Plan"),
                              inputFile(label: "Sta. Pengujian"),
                              inputFile(label: "Sisi"),
                            ],
                          ),
                        ),
                const SizedBox(height: 16.0), // Add some spacing
                CustomTextButton(
                  onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuRigid()));
                              },
                  text: 'Submit',
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(text: 'Compaction Experiment'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 150,
                        child: Column(
                          children: [
                            IconButton(
                                      onPressed: () {
                                        {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => PengujianDetailFormPage()));
                                          };
                                      },
                                      icon: Image.asset(
                                        "assets/image/7day.png",
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                        //color: const Color.fromARGB(255, 255, 0, 0),
                                      ),
                                    ),
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text("7 Days Flexural Strength Testing",)),
                          ],
                        )

                      ),
                      SizedBox(width: 150,
                        child: Column(
                          children: [
                            IconButton(
                                      onPressed: () {
                                        {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => PengujianDetailFormPage()));
                                          };
                                      },
                                      icon: Image.asset(
                                        "assets/image/28day.png",
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                        //color: const Color.fromARGB(255, 255, 0, 0),
                                      ),
                                    ),
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text("28 Days Flexural Strength Testing",)),
                          ],
                        )

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomTitle(text: 'Summary of Flexural Strength Testing'),
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
                      const DataColumn(label: Text('Sample 7 day')),
                      const DataColumn(label: Text('Sample 28 Day')),
                    ],
                    rows: [
                      const DataRow(cells: [
                        DataCell(Text('Row 1, Col 1')),
                        DataCell(Text('Row 1, Col 2')),
                      ]),
                      const DataRow(cells: [
                        DataCell(Text('Row 2, Col 1')),
                        DataCell(Text('Row 2, Col 2')),
                      ]),
                      // Add more DataRow entries as needed
                    ],
                  ),
                ),
            ]),),),),
    );
  }

  /**void _submitForm() {
    // Implement the form submission logic here
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Add your logic for handling the form data (e.g., API call, database storage, etc.)

    // Reset the form after submission
    _formKey.currentState!.reset();
  }**/
}
