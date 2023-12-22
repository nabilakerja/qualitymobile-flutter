import 'package:flutter/material.dart';

/**class SpecTech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Book Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpecTechView(),
    );
  }
}**/

class SpecTechView extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SpecTechView> {
  List<String> books = [
    'Book 1',
    'Book 2',
    'Book 3',
    'Book 4',
    // Add more book titles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Book Library'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(bookTitle: books[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailPage extends StatelessWidget {
  final String bookTitle;

  BookDetailPage({required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookTitle),
      ),
      body: Center(
        child: Text(
          'This is the content of $bookTitle',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
