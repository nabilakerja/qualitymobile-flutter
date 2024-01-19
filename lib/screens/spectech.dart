import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:http/http.dart' as http;

class Spectech {
  final String title;
  final String thumbnail;

  Spectech({required this.title, required this.thumbnail});

  factory Spectech.fromJson(Map<String, dynamic> json) {
    return Spectech(
      title: json['title'],
      thumbnail: json['thumbnail'], // Assuming you have a 'thumbnail' field in your Spectech model
    );
  }
}
class SpectechPage extends StatelessWidget {
  const SpectechPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          title: 'Spesifikasi Teknis',
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Spectech>>(
            future: fetchSpectechData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final spectechList = snapshot.data!;
                return SpectechList(spectechList: spectechList);
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List<Spectech>> fetchSpectechData() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/spectech/'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Spectech.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Spectech data');
    }
  }
}

class SpectechList extends StatelessWidget {
  final List<Spectech> spectechList;

  const SpectechList({super.key, required this.spectechList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: spectechList.length,
      itemBuilder: (context, index) {
        final spectech = spectechList[index];
        return SpectechItem(
          title: spectech.title,
          thumbnail: spectech.thumbnail,
        );
      },
    );
  }
}

class SpectechItem extends StatelessWidget {
  final String title;
  final String thumbnail;

  const SpectechItem({super.key, required this.title, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 240, 241, 243),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.network(
                thumbnail,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
