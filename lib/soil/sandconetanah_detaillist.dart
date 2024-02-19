import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/field_detail.dart';
import 'package:hki_quality/widget/title_custom.dart';

class SandconeTanahDetailListPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const SandconeTanahDetailListPage({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Pengujian Sandcone Pekerjaan Tanah',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Titik Sta.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
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
                        item['sta_point_start'].toString(),
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
                        item['sta_point_to'].toString(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FieldDetailWidget(label: 'Side', value: item['side']),
              const SizedBox(height: 10),
              FieldDetailWidget(label: 'Layer', value: item['layer']),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Kedalaman Lubang',
                  value: item['hole_depth'],),
              const SizedBox(height: 10),
              CustomTitle(
                text: 'Determination Fill Hole',
              ),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat pasir + Botol (Sebelum)',
                  value: item['sand_weight_before'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat pasir + Botol (Sesudah)',
                  value: item['sand_weight_after'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat sisa pasir',
                  value: item['weight_remaining_sand'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat pasir dalam corong',
                  value: item['weight_sand_funnel'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat pasir dalam lubang',
                  value: item['weight_sand_hole'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Density pasir',
                  value: item['sand_density'],
                  suffix: 'gram/cm3'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Volume lubang',
                  value: item['hole_volume'],
                  suffix: 'cm3'),
              const SizedBox(height: 10),
              CustomTitle(
                text: 'Penentuan Kedalaman Lubang',
              ),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat material basah + Pan',
                  value: item['wet_weight_pan'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat material kering + Pan',
                  value: item['dry_weight_pan'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat Pan',
                  value: item['weight_wet_1'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berar air',
                  value: item['water_weight'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat material kering',
                  value: item['weight_dry'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Kadar air',
                  value: item['water_content'],
                  suffix: '%'),
              const SizedBox(height: 10),
              CustomTitle(
                text: 'Penentuan Kepadatan',
              ),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat sampel + Pan',
                  value: item['sample_weight_pan'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat Pan',
                  value: item['weight_wet_2'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat sampel dalam lubang',
                  value: item['sample_weight_hole'],
                  suffix: 'gram'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat basah',
                  value: item['wet_weight'],
                  suffix: 'gr/cm3'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Berat Kering',
                  value: item['dry_weight'],
                  suffix: 'gr/cc'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: '% Kepadatan',
                  value: item['density'],
                  suffix: '%'),
              const SizedBox(height: 10),
              FieldDetailWidget(
                  label: 'Spek Kepadatan',
                  value: item['density_spec'],
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
