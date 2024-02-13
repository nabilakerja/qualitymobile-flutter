import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/field_detail.dart';
import 'package:hki_quality/widget/title_custom.dart';

class ApprovalMaterialDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const ApprovalMaterialDetailPage({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Persetujuan Bahan Pekerjaan Tanah',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
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
                          item['preparations']['time_at'],
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
                          item['preparations']['latitude'],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: const Text(","),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          item['preparations']['longitude'],
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
                            item['preparations']['project'].toString(),
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
              FieldDetailWidget(
                  label: 'Asal Material', value: item['asal_material']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Kedalaman',
                  value: item['kedalaman'],
                  suffix: 'meter'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Klasifikasi Tanah', value: item['klasifikasi_tanah']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Max Dry Density (MDD)',
                  value: item['mdd'],
                  suffix: 'gr/cm3'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Optimum Moisture Content (OMC)',
                  value: item['omc'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Liquid Limit',
                  value: item['liquid_limit'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Plastic Index',
                  value: item['plastic_index'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Plastic Limit',
                  value: item['plastic_limit'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Specific Gravity',
                  value: item['specific_gravity'],
                  suffix: 'gr/cm3'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'CBR at 100% MDD after 4 days soaked',
                  value: item['cbr'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Swelling Potensial',
                  value: item['swelling_potential'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Active Value',
                  value: item['active_values'],
                  suffix: '%'),
              const SizedBox(height: 10),
              CustomTitle(
                text: 'Analisis Saringan',
              ),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: '4,76 mm | 4 inch',
                  value: item['sa_476'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: '2,00 mm | 10 inch', value: item['sa_2'], suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: '0,42 mm | 40 inch',
                  value: item['sa_042'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: '0,149 mm | 100 inch',
                  value: item['sa_0149'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: '0,074 mm | 200 inch',
                  value: item['sa_0074'],
                  suffix: '%'),
              const SizedBox(height: 10),
              // Add more widgets to display additional details if needed
            ],
          ),
        ),
      ),
    );
  }
}
