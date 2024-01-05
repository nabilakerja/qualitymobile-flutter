// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<String> comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Komentar",
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10,bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(comments[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (comment) {
                        // Update komentar saat pengguna mengetik
                      },
                      onSubmitted: (comment) {
                        // Tambahkan komentar ke daftar saat pengguna mengirimkan
                        setState(() {
                          comments.add(comment);
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Tambahkan komentar...',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue, // You can set the border color
                            width: 2.0,          // You can set the border width
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0), // You can set the border radius
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      // Tambahkan komentar ke daftar saat pengguna menekan tombol kirim
                      setState(() {
                        comments.add("New comment");
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}