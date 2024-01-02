// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class SpecTech extends StatelessWidget {
  const SpecTech({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
        title: 'Spesifikasi Teknis',
        
      ),
        body: Container(
          padding: const EdgeInsets.only(top: 5),
          child: EbookList()),
      ),
    );
  }
}

class EbookList extends StatelessWidget {
  final List<Map<String, String>> ebooks = [
    {'title': 'DIVISI 1 (UMUM)', 'author': 'Author 1', 'cover': 'cover.png'},
    {'title': 'DIVISI 2 (PEMBERSIHAN TEMPAT KERJA)', 'author': 'Author 2', 'cover': 'cover.png'},
    {'title': 'DIVISI 3 (PEMBONGKARAN)', 'author': 'Author 3', 'cover': 'cover.png'},
    // Add more ebooks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ebooks.length,
      itemBuilder: (context, index) {
        return EbookItem(
          title: ebooks[index]['title']!,
          author: ebooks[index]['author']!,
          cover: ebooks[index]['cover']!,
        );
      },
    );
  }
}

class EbookItem extends StatelessWidget {
  final String title;
  final String author;
  final String cover;

  EbookItem({required this.title, required this.author, required this.cover});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: const Color.fromARGB(255, 240, 241, 243),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // Set your desired radius here
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 7,right: 7),
        leading: Image.asset(
          'assets/image/$cover', // Assuming your cover images are in the 'assets' folder
          width: 50,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Text(author),
        trailing: IconButton(
          icon: const Icon(Icons.download), // You can use any download icon
          onPressed: () {
            // Add your download logic here
          },
        ),
        onTap: () {
          // Handle tap on ebook item
        },
      ),
    );
  }
}
