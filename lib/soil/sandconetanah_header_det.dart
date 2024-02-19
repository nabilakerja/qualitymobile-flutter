import 'package:flutter/material.dart';
import 'package:hki_quality/soil/sandconetanah_det_list_det.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/field_detail.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/title_custom_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SandconeTanahDetailPage extends StatefulWidget {
  final int sandconeId;
  final Map<String, dynamic> item;

  const SandconeTanahDetailPage({
    Key? key,
    required this.sandconeId,
    required this.item,
  }) : super(key: key);

  @override
  _SandconeTanahDetailPageState createState() =>
      _SandconeTanahDetailPageState();
}

class _SandconeTanahDetailPageState extends State<SandconeTanahDetailPage> {
  late Future<List<dynamic>> _sandconeDetail;

  @override
  void initState() {
    super.initState();
    _sandconeDetail = fetchSandconeDetails(widget.sandconeId);
  }

  Future<List<dynamic>> fetchSandconeDetails(int sandconeId) async {
    final url = Uri.parse(
        'http://10.0.2.2:8000//equality/detailsandconesoil/?sandcone_id=$sandconeId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load sandcone details');
      }
    } catch (error) {
      print(error);
      throw Exception('Network error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Sandcone Pekerjaan Sandcone Tanah',
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                            widget.item['testings']['time_at'],
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
                            widget.item['testings']['latitude'],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text(","),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            widget.item['testings']['longitude'],
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
                              widget.item['testings']['project'].toString(),
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
                          widget.item['testings']['sta_start'].toString(),
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
                          widget.item['testings']['sta_to'].toString(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                FieldDetailWidget(
                    label: 'Sumber Material',
                    value: widget.item['source_material']),
                const SizedBox(height: 10),
                FieldDetailWidget(label: 'MDD', value: widget.item['mdds']),
                const SizedBox(height: 10),
                FieldDetailWidget(label: 'OMC', value: widget.item['omcs']),
                const SizedBox(height: 15),
                CustomTitleButton(
                  title: 'Field Density Test',
                  onPressed: () {
                    // Navigate to the DetailPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListSandconeTanahDetailDet()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomTitle(
                  text: 'Summary Pengujian Sandcone Tanah',
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _sandconeDetail,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final sandconeDetailList = snapshot.data!;
                  if (sandconeDetailList.isEmpty) {
                    return const Center(child: Text('No data available'));
                  }
                  return SingleChildScrollView(
                    padding:
                        const EdgeInsets.only(left: 7, right: 7, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('Side')),
                            DataColumn(label: Text('Layer')),
                            DataColumn(label: Text('Wt Content')),
                            DataColumn(label: Text('Density')),
                          ],
                          rows:
                              sandconeDetailList.map<DataRow>((sandconeDetail) {
                            return DataRow(cells: [
                              DataCell(Text('${sandconeDetail['side']}')),
                              DataCell(Text('${sandconeDetail['layer']}')),
                              DataCell(
                                  Text('${sandconeDetail['water_content']}')),
                              DataCell(Text('${sandconeDetail['density']}')),
                            ]);
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
