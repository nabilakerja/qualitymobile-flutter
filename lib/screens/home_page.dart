import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/menu.dart';
import 'package:hki_quality/beton/menu.dart';
import 'package:hki_quality/screens/login.dart';
import 'package:hki_quality/screens/profile_edit.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/agregat/menu.dart';
import 'package:hki_quality/rigid/menu.dart';

import 'package:http/http.dart' as http;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<List<Map<String, dynamic>>> fetchNews() async {
    final response = await http.get(
      Uri.parse('${DjangoConstants.backendBaseUrl}/latest-news/'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> newsList = jsonDecode(response.body);
      return newsList.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load news');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          margin: const EdgeInsets.only(left: 5, top: 30),
          child: Text('Welcome, $loggedInUsername!'),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 30, right: 20),
              width: 30,
              height: 30,
              child: Image.asset(
                "assets/image/notification.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(235, 255, 255, 255),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            /**const NewsCard(
              title: 'Flutter News App',
              description: 'Learn how to create a news app in Flutter.',
              image: 'assets/image/news.jpeg',
            ),**/
            const SizedBox(height: 20),
            /**CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                NewsCard(newsData: fetchNews()),
                // Add more NewsCard widgets as needed
              ],
            ),**/
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: const Text(
                    "Kategori Menu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemKategori(
                        title: "Tanah",
                        icon: "assets/image/soil.png",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MenuSoil()));
                        },
                      ),
                      ItemKategori(
                        title: "Agregat",
                        icon: "assets/image/agregat.png",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MenuAgregat()));
                        },
                      ),
                      ItemKategori(
                        title: "Rigid",
                        icon: "assets/image/rigid.png",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MenuRigid()));
                        },
                      ),
                      ItemKategori(
                        title: "Beton",
                        icon: "assets/image/beton.png",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MenuBeton()));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemKategori(
                        title: "Aspal",
                        icon: "assets/image/aspal.png",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MenuAspal()));
                        },
                      ),
                      ItemKategori(
                        title: "Bore Pile",
                        icon: "assets/image/borepile.png",
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuSoil()));
                        },
                      ),
                      ItemKategori(
                        title: "Spun Pile",
                        icon: "assets/image/spunpile.png",
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuSoil()));
                        },
                      ),
                      ItemKategori(
                        title: "Girder",
                        icon: "assets/image/girder.png",
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuSoil()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                color: const Color.fromARGB(
                    235, 211, 14, 14), // Set the background color
                child: const Text(
                  'Latest Update',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white, // Set the text color
                  ),
                ),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}

class ItemKategori extends StatelessWidget {
  const ItemKategori({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(
              icon,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> newsData;

  const NewsCard({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: newsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Map<String, dynamic>> newsList = snapshot.data ?? [];
          return CarouselSlider(
            options: CarouselOptions(
              // ... (carousel options)
            ),
            items: newsList.map((newsItem) {
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      newsItem['image'],
                      height: 150.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsItem['title'],
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(newsItem['content']),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}