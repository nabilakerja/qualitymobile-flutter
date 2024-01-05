import 'package:flutter/material.dart';
import 'package:hki_quality/aspal/menu.dart';
import 'package:hki_quality/beton/menu.dart';
import 'package:hki_quality/soil/menu.dart';
import 'package:hki_quality/agregat/menu.dart';
import 'package:hki_quality/rigid/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: 'Flutter Home View Example',
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          margin: const EdgeInsets.only(left:5 ,top: 30),
          child: RichText(
            text: const TextSpan(
              text: "Hello, ",
              style: TextStyle(
                color: Color.fromARGB(235, 0, 0, 0),
                fontSize: 18
                ),
              children: [
                TextSpan(
                  text: "James",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    )
                )
                ],
                ),
            ),
        ),
        actions: [
          GestureDetector(
            onTap:() {},
            child: Container(
              margin: const EdgeInsets.only(top: 30,right: 20),
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
            const NewsCard(
              title: 'Flutter News App',
              description: 'Learn how to create a news app in Flutter.',
              image: 'assets/image/news.jpeg',
            ),
            Column(
              children:[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 20),
                      child: const Text("Kategori Menu",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left:15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemKategori(
                            title: "Tanah",
                            icon: "assets/image/soil.png",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuSoil()));
                              },
                          ),
                          ItemKategori(
                            title: "Agregat",
                            icon: "assets/image/agregat.png",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuAgregat()));
                              },
                          ),
                          ItemKategori(
                            title: "Rigid",
                            icon: "assets/image/rigid.png",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuRigid()));
                              },
                          ),
                          ItemKategori(
                            title: "Beton",
                            icon: "assets/image/beton.png",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuBeton()));
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left:15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemKategori(
                            title: "Aspal",
                            icon: "assets/image/aspal.png",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuAspal()));
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
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: const Color.fromARGB(235, 211, 14, 14), // Set the background color
                    child: const Text(
                      'Latest Update',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white, // Set the text color
                      ),
                    ),
                  ),
                ),
                Container(
                  
                )
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
  final String title;
  final String description;
  final String image;

  const NewsCard({super.key, 
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}