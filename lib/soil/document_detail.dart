import 'package:flutter/material.dart';
import 'package:hki_quality/soil/kalibrasi.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/field_detail.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/title_custom_button.dart';

class DecumentDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const DecumentDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Kelengkapan Dokumen Persiapan Pekerjaan Tanah',
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
              const Text(
                "Sta.",
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
                        item['sta_start'].toString(),
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
                        item['sta_to'].toString(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTitle(
                text: 'Pengajuan Izin Kerja',
              ),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Shop Drawing', value: item['shop_drawing']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Metode Kerja', value: item['working_method']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Joint Survey', value: item['joint_survey']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Job Safety Analysis',
                  value: item['job_safety_analys']),
              const SizedBox(height: 10),
              CustomTitle(
                text: 'Alat Berat',
              ),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Sertifikat Izin Operator',
                  value: item['sert_op_permit']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Surat Izin Layak Operasi',
                  value: item['layak_operasi']),
              const SizedBox(height: 10),
              CustomTitle(
                text: 'Alat Penunjang (Jika diperlukan)',
              ),
              const SizedBox(height: 10),
              FieldDetailWidget(label: 'Patok', value: item['patok']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Sattlement Plate', value: item['sattlement_plate']),
              const SizedBox(height: 10),
              CustomTitleButton(
                title: 'Kalibrasi',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Kalibrasi()));
                },
              ),
              // Add more details about the item as needed
            ],
          ),
        ),
      ),
    );
  }
}
