import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class SpecTech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
        title: 'Spesifikasi Teknis',
        
      ),
        body: Container(
          padding: EdgeInsets.only(top: 5),
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
      margin: EdgeInsets.all(8.0),
      color: Color.fromARGB(255, 240, 241, 243),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // Set your desired radius here
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 7,right: 7),
        leading: Image.asset(
          'assets/image/$cover', // Assuming your cover images are in the 'assets' folder
          width: 50,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Text(author),
        trailing: IconButton(
          icon: Icon(Icons.download), // You can use any download icon
          onPressed: () {
            // Add your download logic here
          },
        ),
        onTap: () {
          // Handle tap on ebook item
          print('Tapped on $title');
        },
      ),
    );
  }
}
