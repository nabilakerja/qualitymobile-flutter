// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print
import 'dart:convert';

import 'package:hki_quality/API/csrf_token.dart';
import 'package:hki_quality/soil/sandconetanah_detail_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/button_submit.dart';
import 'package:hki_quality/widget/dropdown.dart';
import 'package:hki_quality/widget/title_custom.dart';
import 'package:hki_quality/widget/input_file.dart';
import 'package:hki_quality/widget/twofield.dart';

class SandconeTanahDetailFormPage extends StatefulWidget {
  const SandconeTanahDetailFormPage({super.key});

  @override
  _SandconeTanahDetailFormPageState createState() =>
      _SandconeTanahDetailFormPageState();
}

class _SandconeTanahDetailFormPageState
    extends State<SandconeTanahDetailFormPage> {
  String? selectedSisi, selectedLayer;

  final TextEditingController staPointStartController = TextEditingController();
  final TextEditingController staPointToController = TextEditingController();
  final TextEditingController sideController = TextEditingController();
  final TextEditingController layerController = TextEditingController();
  final TextEditingController holeDepthController = TextEditingController();
  final TextEditingController sandWeightBeforeController = TextEditingController();
  final TextEditingController sandWeightAfterController = TextEditingController();
  final TextEditingController weightRemainingSandController = TextEditingController();
  final TextEditingController weightSandFunnelController = TextEditingController();
  final TextEditingController weightSandHoleController = TextEditingController();
  final TextEditingController sandDensityController = TextEditingController();
  final TextEditingController holeVolumeController = TextEditingController();
  final TextEditingController wetWeightPanController = TextEditingController();
  final TextEditingController dryWeightPanController = TextEditingController();
  final TextEditingController panWeight1Controller = TextEditingController();
  final TextEditingController waterWeightController = TextEditingController();
  final TextEditingController dryWeight1Controller = TextEditingController();
  final TextEditingController waterContentController = TextEditingController();
  final TextEditingController sampleWeightPanController = TextEditingController();
  final TextEditingController panWeight2Controller = TextEditingController();
  final TextEditingController sampleWeightHoleController = TextEditingController();
  final TextEditingController wetWeightController = TextEditingController();
  final TextEditingController dryWeight2Controller = TextEditingController();
  final TextEditingController densityController = TextEditingController();
  final TextEditingController densitySpecController = TextEditingController();

  late CSRFTokenHandler csrfTokenHandler;
  String? csrfToken;
  List<DataRow> dataRows = [];
  List<dynamic> sisi = ['L1', 'L2', 'L3', 'R1', 'R2', 'R3'];
  List<dynamic> layer = ['1', '2', '3','4','5','6','7','8','9','TSG'];

  double weightRemainingSandValue = 0.0;
  double sandWeightBeforeValue = 0.0;
  double sandWeightAfterValue = 0.0;
  double weightSandFunnelValue = 0.0;
  double sandDensityValue = 0.0;
  double wetWeightPanValue = 0.0;
  double dryWeightPanValue = 0.0;
  double panWeight1Value = 0.0;
  double sampleWeightPanValue = 0.0;
  double panWeight2Value = 0.0;
  double densitySpecValue = 0.0;

  @override
  void initState() {
    super.initState();
    csrfTokenHandler = CSRFTokenHandler();
    // Fetch CSRF token when the widget is initialized
    fetchCSRFToken();
  }

  Future<void> fetchCSRFToken() async {
    await csrfTokenHandler.fetchCSRFToken();
    // Now that CSRF token is available, you can proceed with other operations
  }

  Future<int?> fetchSandconeDetail() async {
    if (csrfTokenHandler.csrfToken == null) {
      print('CSRF token not available. Aborting request.');
      return null;
    }

    // Replace these with your Django backend details
    const String baseUrl =
        'http://10.0.2.2:8000'; // Replace with your Django backend base URL
    const String sandconedetailUrl = '$baseUrl/equality/detail-sandcones-soil/';
    //String userProject = await getUserProject(loggedInUsername);

    Map<String, dynamic> formData = {
      'sta_point_start': double.tryParse(staPointStartController.text) ?? 0.0,
      'sta_point_to': double.tryParse(staPointToController.text) ?? 0.0,
      'side': selectedSisi,
      'layer': selectedLayer,
      'hole_depth': double.tryParse(holeDepthController.text) ?? 0.0,
      'sand_weight_before':
          double.tryParse(sandWeightBeforeController.text) ?? 0.0,
      'sand_weight_after':
          double.tryParse(sandWeightAfterController.text) ?? 0.0,
      'weight_remaining_sand':
          double.tryParse(weightRemainingSandController.text) ?? 0.0,
      'weight_sand_funnel':
          double.tryParse(weightSandFunnelController.text) ?? 0.0,
      'weight_sand_hole': double.tryParse(weightSandHoleController.text) ?? 0.0,
      'sand_density': double.tryParse(sandDensityController.text) ?? 0.0,
      'hole_volume': double.tryParse(holeVolumeController.text) ?? 0.0,
      'wet_weight_pan': double.tryParse(wetWeightPanController.text) ?? 0.0,
      'dry_weight_pan': double.tryParse(dryWeightPanController.text) ?? 0.0,
      'weight_wet_1': double.tryParse(panWeight1Controller.text) ?? 0.0,
      'water_weight': double.tryParse(waterWeightController.text) ?? 0.0,
      'weight_dry': double.tryParse(dryWeight1Controller.text) ?? 0.0,
      'water_content': double.tryParse(waterContentController.text) ?? 0.0,
      'sample_weight_pan':
          double.tryParse(sampleWeightPanController.text) ?? 0.0,
      'weight_wet_2': double.tryParse(panWeight2Controller.text) ?? 0.0,
      'sample_weight_hole':
          double.tryParse(sampleWeightHoleController.text) ?? 0.0,
      'wet_weight': double.tryParse(wetWeightController.text) ?? 0.0,
      'dry_weight': double.tryParse(dryWeight2Controller.text) ?? 0.0,
      'density': double.tryParse(densityController.text) ?? 0.0,
      'density_spec': double.tryParse(densitySpecController.text) ?? 0.0,
    };

    try {
      final response = await http.post(
        Uri.parse(sandconedetailUrl),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfTokenHandler.csrfToken!,
        },
        body: jsonEncode(formData),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('respon: $responseData');
        return responseData['id'];
      } else {
        print('Submit failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Error during Submit: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sandcone Tanah Detail',
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    TwoFieldsWithLabel(
                      label: "Sta. Point",
                      controller1: staPointStartController,
                      controller2: staPointToController,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    DropdownWidget(
                      hintText: 'Pilih Sisi L/R',
                      label: "Sisi",
                      selectedValue: selectedSisi,
                      items: sisi,
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedSisi = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    DropdownWidget(
                      hintText: 'Pilih Layer',
                      label: "Layer",
                      selectedValue: selectedLayer,
                      items: layer,
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedLayer = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    inputFile(
                      label: "Hole Depth",
                      suffixText: "%",
                      controller: holeDepthController,
                    ),
                  ],
                ),
              ),
              CustomTitle(text: 'Determination Fill Hole'),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Column(
                  children: <Widget>[
                    inputFile(
                      label: "Weight of sand + Bottle (before)",
                      suffixText: "gram",
                      controller: sandWeightBeforeController,
                      onSubmitted: (double value) {
                        setState(() {
                          sandWeightBeforeValue = value; // Update the variable
                        });
                        print('Submitted Integer: $sandWeightBeforeValue');
                      },
                    ),
                    inputFile(
                      label: "Weight of sand + Bottle (after)",
                      suffixText: "gram",
                      controller: sandWeightAfterController,
                      onSubmitted: (double value) {
                        setState(() {
                          sandWeightAfterValue = value; // Update the variable
                          formulaResult(); 
                        });
                        print('Submitted Integer: $sandWeightAfterValue');
                      },
                    ),
                    inputFile(
                      label: "Weight of Remaining Sand",
                      suffixText: "gram",
                      controller: weightRemainingSandController,
                      backgroundColor: const Color.fromARGB(255, 177, 177, 177),
                      readOnly: true,
                    ),
                    inputFile(
                      label: "Weight of Sand In The Funnel",
                      suffixText: "gram",
                      controller: weightSandFunnelController,
                      onSubmitted: (double value) {
                        setState(() {
                          weightSandFunnelValue = value; // Update the variable
                          formulaResult(); 
                        });
                        print('Submitted Integer: $weightSandFunnelValue');
                      },
                    ),
                    inputFile(
                      label: "Weight of Sand In The Hole",
                      suffixText: "gram",
                      controller: weightSandHoleController,
                      backgroundColor: const Color.fromARGB(255, 177, 177, 177),
                      readOnly: true,
                    ),
                    inputFile(
                      label: "Sand Density",
                      suffixText: "gram",
                      controller: sandDensityController,
                      onSubmitted: (double value) {
                        setState(() {
                          sandDensityValue = value; // Update the variable
                          formulaResult(); 
                        });
                        print('Submitted Integer: $sandDensityValue');
                      },
                    ),
                    inputFile(
                      label: "Hole Volume",
                      suffixText: "gram",
                      controller: holeVolumeController,
                      backgroundColor: const Color.fromARGB(255, 177, 177, 177),
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              CustomTitle(text: 'Determine The Depth of The Hole'),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Column(
                  children: <Widget>[
                    inputFile(
                      label: "Wet Weight + Pan",
                      suffixText: "gram",
                      controller: wetWeightPanController,
                      onSubmitted: (double value) {
                        setState(() {
                          wetWeightPanValue = value; // Update the variable
                          formulaResult(); 
                        });
                        print('Submitted Integer: $wetWeightPanValue');
                      },
                    ),
                    inputFile(
                      label: "Dry Weight + Pan",
                      suffixText: "%",
                      controller: dryWeightPanController,
                      onSubmitted: (double value) {
                        setState(() {
                          dryWeightPanValue = value; // Update the variable
                          formulaResult(); 
                        });
                        print('Submitted Integer: $dryWeightPanValue');
                      },
                    ),
                    inputFile(
                      label: "Pan Weight",
                      suffixText: "gram",
                      controller: panWeight1Controller,
                      onSubmitted: (double value) {
                        setState(() {
                          panWeight1Value = value; // Update the variable
                          formulaResult(); 
                        });
                        print('Submitted Integer: $panWeight1Value');
                      },
                    ),
                    inputFile(
                      label: "Water Weight",
                      suffixText: "%",
                      controller: waterWeightController,
                      backgroundColor: const Color.fromARGB(255, 177, 177, 177),
                      readOnly: true,
                    ),
                    inputFile(
                      label: "Dry Weight",
                      suffixText: "gram",
                      controller: dryWeight1Controller,
                      backgroundColor: const Color.fromARGB(255, 177, 177, 177),
                      readOnly: true,
                    ),
                    inputFile(
                      label: "Water Content",
                      suffixText: "gram",
                      controller: waterContentController,
                      backgroundColor: const Color.fromARGB(255, 177, 177, 177),
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              CustomTitle(text: 'Determine of Density'),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget>[
                    inputFile(
                      label: "Sample Weight + Pan",
                      suffixText: "gram",
                      controller: sampleWeightPanController,
                      onSubmitted: (double value) {
                        setState(() {
                          sampleWeightPanValue = value; // Update the variable
                          formulaResult(); 
                        });
                        print('Submitted Integer: $sampleWeightPanValue');
                      },
                    ),
                    inputFile(
                      label: "Pan Weight",
                      suffixText: "gram",
                      controller: panWeight2Controller,
                      onSubmitted: (double value) {
                        setState(() {
                          panWeight2Value = value; // Update the variable
                          formulaResult(); 
                        });
                        print('Submitted Integer: $panWeight2Value');
                      },
                    ),
                    inputFile(
                      label: "Sample Weight In Hole",
                      suffixText: "gram",
                      controller: sampleWeightHoleController,
                      backgroundColor: const Color.fromARGB(255, 177, 177, 177),
                      readOnly: true,
                    ),
                    inputFile(
                      label: "Wet Weight",
                      suffixText: "gr/cm3",
                      controller: wetWeightController,
                      backgroundColor: const Color.fromARGB(255, 177, 177, 177),
                      readOnly: true,
                    ),
                    inputFile(
                      label: "Dry Weight",
                      suffixText: "gr/cc",
                      controller: dryWeight2Controller,
                      backgroundColor: const Color.fromARGB(255, 177, 177, 177),
                      readOnly: true,
                    ),
                    inputFile(
                      label: "% Density",
                      suffixText: "%",
                      controller: densityController,
                    ),
                    inputFile(
                      label: "Density Spec",
                      suffixText: "%",
                      controller: densitySpecController,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16.0), // Add some spacing
              CustomTextButton(
                onPressed: () async {
                  await fetchSandconeDetail();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ListSandconeTanahDetail(), // Replace YourNextScreen with the actual widget for the next screen
                    ),
                  );
                },
                text: 'Submit',
              ),
            ]),
          ),
        ),
      ),
    );
  }
  void formulaResult() {
    // Lakukan operasi matematika
    double weightRemainingSand =  sandWeightBeforeValue - sandWeightAfterValue;
    double weightSandHole = weightRemainingSand - weightSandFunnelValue;
    double holeVolume = weightSandHole / sandDensityValue;
    double waterWeight = wetWeightPanValue - dryWeightPanValue;
    double dryWeight1 = dryWeightPanValue - panWeight1Value;
    double waterContent = (waterWeight/dryWeight1)*100;
    double sampleWeightHole = sampleWeightPanValue - panWeight2Value;
    print(sampleWeightPanValue);
    print(panWeight2Value);
    print(sampleWeightHole);
    double wetWeight = sampleWeightHole / holeVolume;
    double dryWeight2 = (wetWeight*100)/(100+waterContent);
    
    // Tampilkan hasil pada field output
    weightRemainingSandController.text = weightRemainingSand.toStringAsFixed(3);
    weightSandHoleController.text = weightSandHole.toStringAsFixed(3);
    holeVolumeController.text = holeVolume.toStringAsFixed(3);
    waterWeightController.text = waterWeight.toStringAsFixed(3);
    dryWeight1Controller.text = dryWeight1.toStringAsFixed(3);
    waterContentController.text = waterContent.toStringAsFixed(3);
    sampleWeightHoleController.text = sampleWeightHole.toStringAsFixed(3);
    wetWeightController.text = wetWeight.toStringAsFixed(3);
    dryWeight2Controller.text = dryWeight2.toStringAsFixed(3);
  }
    }