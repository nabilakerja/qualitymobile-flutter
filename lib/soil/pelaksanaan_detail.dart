import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/field_detail.dart';
import 'package:hki_quality/widget/title_custom.dart';

class PelaksanaanDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const PelaksanaanDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Pelaksanaan Pekerjaan Tanah',
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
                          item['implementations']['time_at'],
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
                          item['implementations']['latitude'],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: const Text(","),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          item['implementations']['longitude'],
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
                            item['implementations']['project'].toString(),
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
              FieldDetailWidget( label: 'Pekerjaan', value: item['work']),
              const SizedBox(height: 10),
              const Text(
                "Sta. Pelaksanaan",
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
                        item['implementations']['sta_start'].toString(),
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
                        item['implementations']['sta_to'].toString(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTitle(text: 'Pelaksanaan',),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Lapisan material sebelum dipadatkan tidak lebih dari 20 cm, kecuali alat dapat memadatkan lebih dari 20 cm dengan kepadatan seragam.', value: item['layer_material']),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Ketebalan gembur lapisan tidak melebihi 10 cm, dipadatkan dengan mechanical hammers.', value: item['brittle_thickness']),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Dipadatkan arah memanjang dan melintang.', value: item['compacted']),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Area tepi / lereng, dilebihkan ±50 cm, dipadatkan kemudian di-cutting dengan bucket excavator.', value: item['slope_area']),
              const SizedBox(height: 10),
              CustomTitle(text: 'Hasil Pekerjaan',),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Permukaan rata / tidak bergelombang.', value: item['flat_surface']),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Kemiringan lereng / sloope sesuai desain.', value: item['slope']),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Lainnya', value: item['opsional']),
              const SizedBox(height: 10),
              CustomTitle(text: 'Dokumentasi',),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Keadaan Eksisting (Progress 0%)', value: item['existing_0']),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Keadaan Eksisting (Progress 50%)', value: item['spreading_50']),
              const SizedBox(height: 10),
              FieldDetailWidget( label: 'Keadaan Eksisting (Progress 100%)', value: item['spreading_100']),
              const SizedBox(height: 10),
              // Add more details about the item as needed
            ],
          ),
        ),
      ),
    );
  }
}
