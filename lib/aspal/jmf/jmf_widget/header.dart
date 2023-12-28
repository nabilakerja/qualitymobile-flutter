import 'package:flutter/material.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/title_custom.dart';

class FieldHeaderBody extends StatefulWidget {
  @override
  _FieldHeaderBodyState createState() => _FieldHeaderBodyState();
}

class _FieldHeaderBodyState extends State<FieldHeaderBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
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
                                  ))])],),),),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Type Asphalt"),
                              inputFile(label: "Work Item"),
                              inputFile(label: "Type Of Material"),
                              inputFile(label: "Sumber Material"),
                            ],
                          ),
                        ),
                        CustomTitle(
                          text: 'Hot Bin',
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Column(
                            children: <Widget>[
                              inputFile(label: "Hot Bin IV (Pass 1 1/2” Ret 3/4”)", suffixText: "%"),
                              inputFile(label: "FHot Bin III (Pass 3/4” Ret 3/8”)low", suffixText: "%"),
                              inputFile(label: "Hot Bin II (Pass 3/8” Ret No 4)", suffixText: "%"),
                              inputFile(label: "Hot Bin I (Pass No. 4)", suffixText: "%"),
                            ],
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
