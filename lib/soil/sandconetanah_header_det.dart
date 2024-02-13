import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/field_detail.dart';
import 'package:hki_quality/widget/title_custom.dart';

class SandconeTanahDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const SandconeTanahDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Sandcone Pekerjaan Tanah',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/calendar.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          item['testings']['time_at'],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          item['testings']['latitude'],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: const Text(","),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          item['testings']['longitude'],
                        ),
                      ),
                      Image.asset(
                        'assets/image/location.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0x7CFFE0E0),
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: const Color(0x79F61118),
                      width: 2.0,
                    ),
                  ),
                  height: 54,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFF0000),
                                  Color.fromARGB(255, 0, 0, 0)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3.0),
                                topRight: Radius.circular(0.0),
                                bottomLeft: Radius.circular(3.0),
                                bottomRight: Radius.circular(0.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/image/building.png",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: SizedBox(height: 12.0),
                          ),
                          Text(
                            item['testings']['project'].toString(),
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sta. Dynamic Cone Penetrometer",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        item['testings']['sta_start'].toString(),
                      ),
                    ),
                  ),
                  const SizedBox(
                      width:
                          5), // Add some spacing between the text fields and the icon
                  const Icon(
                    Icons.add,
                    size: 25.0, // Change the icon size as needed
                  ),
                  const SizedBox(
                      width:
                          5), // Add some spacing between the text fields and the icon
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        item['testings']['sta_to'].toString(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Sumber Material',
                  value: item['source_material']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'MDD',
                  value: item['mdds']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'OMC',
                  value: item['omcs']),
              const SizedBox(height: 15),
              CustomTitle(
                text: 'Summary Pengujian Sandcone Tanah',
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 15),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (item['detail_soil_data'] as List<dynamic>).map((summaryy) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama             : ${summaryy['side']}'),
                    Text('Perusahaan   : ${summaryy['layer']}'),
                    Text('Posisi             : ${summaryy['hole_depth']}'),
                    const Divider(), // Add a divider between attendees
                  ],
                );
              }).toList(),
            ),
              // Add more details about the item as needed
            ],
          ),
        ),
      ),
    );
  }
}
