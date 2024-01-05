// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hki_quality/screens/comment.dart';
import 'package:hki_quality/soil/sandconetanah_header.dart';
import 'package:hki_quality/widget/appbar_theme.dart';
import 'package:hki_quality/widget/bubblebutton.dart';

class ListSandconeTanahHeader extends StatelessWidget {

  List<Map<String, dynamic>> items = [
    {
      'item': 'Item 1',
      'sta': '05+000',
      'aktifitas': 'Binjai - Pangkalan Brandan',
      'tanggal': '2022-01-01',
      'user': 'Bessie Coleman',
      'image': 'assets/image/mattew.jpeg', // replace with actual image URL
      'status': 'Approved SEM',
    },
    {
      'item': 'Item 2',
      'sta': '05+1000',
      'aktifitas': 'Binjai - Pangkalan Brandan',
      'tanggal': '2022-01-02',
      'user': 'Bessie Coleman',
      'image': 'assets/image/mattew.jpeg', // replace with actual image URL
      'status': 'Draft',
    },
    {
      'item': 'Item 1',
      'sta': '05+000',
      'aktifitas': 'Binjai - Pangkalan Brandan',
      'tanggal': '2022-01-01',
      'user': 'Bessie Coleman',
      'image': 'assets/image/mattew.jpeg', // replace with actual image URL
      'status': 'Rejected',
    },
    {
      'item': 'Item 2',
      'sta': '05+100',
      'aktifitas': 'Binjai - Pangkalan Brandan',
      'tanggal': '2022-01-02',
      'user': 'Bessie Coleman',
      'image': 'assets/image/mattew.jpeg', // replace with actual image URL
      'status': 'Inreview',
    },
    // ... other items
  ];

  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
        title: 'List Pengujian Pekerjaan Sandcone Tanah',
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
          child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // Apply filters to the list
                  if (selectedFilters.isNotEmpty &&
                      !selectedFilters.contains(items[index]['item'])) {
                    return Container(); // Return an empty container if the item is not selected
                  }
                  // Display the item within a Container
                  return Container(
                    // Apply styling or additional properties here
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 20.0,
                        )
                      ]
                    ),
                    child: ListTile(
                      //leading: 
                      subtitle: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(items[index]['image']),
                              ),
                              const SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'STA ${items[index]['sta']}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      const SizedBox(width: 25,),
                                      Container(
                                        padding: const EdgeInsets.only(top: 4,bottom: 4,right: 8,left: 8),
                                        decoration: BoxDecoration(
                                          //border: Border.all(color: const Color.fromARGB(255, 195, 195, 195)),
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: getStatusColor(items[index]['status']), // Set background color based on status
                                        ),
                                        
                                        child: Row(
                                          children: [
                                            getStatusIcon(items[index]['status']),
                                            const SizedBox(width: 8),
                                            Text(
                                              '${items[index]['status']}',
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Text('${items[index]['aktifitas']}',
                                  style: const TextStyle(color: Color(0xFF8696BB)),),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            height: 0.5,
                            color: const Color(0xFF8696BB),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset("assets/image/date.png")),
                                  const SizedBox(width: 5,),
                                  Text('${items[index]['tanggal']}',
                                  style: const TextStyle(color: Color(0xFF8696BB)),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset("assets/image/pekerja.png")),
                                  const SizedBox(width: 5,),
                                  Text('${items[index]['user']}',
                                  style: const TextStyle(color: Color(0xFF8696BB)),),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add logic to navigate to the detail page
                                    // You can pass the item details to the detail page if needed
                                    // For example:
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(item: item)));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0), // Set your desired border radius
                                        side: const BorderSide(color: Color.fromARGB(255, 219, 11, 11)), // Set your desired border color
                                      ),
                                    ),
                                  ),
                                  child: const Text('Detail', style: TextStyle(color: Color.fromARGB(255, 219, 11, 11)),),
                                ),
                              ),
                              const SizedBox(width: 25,),
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CommentPage()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 219, 11, 11)),
                                    ),
                                  child: const Text('Comment', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Add more properties as needed
                    ),
                  );
                },
              ),
            ),
          ],
          ),
        ),
          floatingActionButton: BubbleButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SandconeHeaderPage()));
              },
            ),
    )
    );
  }
  Color getStatusColor(String status) {
  switch (status) {
    case 'Approved SEM':
      return const Color(0xFF07864B); 
    case 'Draft':
      return const Color(0xFF646464); 
    case 'Rejected':
      return const Color(0xFFEB1D24); 
    case 'Inreview':
      return const Color(0xFF211DEB); 
    default:
      return Colors.grey; 
  }
}
Icon getStatusIcon(String status) {
  switch (status) {
    case 'Approved SEM':
      return const Icon(Icons.check_circle, color: Colors.white, size: 15);
    case 'Draft':
      return const Icon(Icons.drafts, color: Colors.white, size: 15);
    case 'Rejected':
      return const Icon(Icons.error, color: Colors.white, size: 15); 
    case 'Inreview':
      return const Icon(Icons.timer, color: Colors.white, size: 15);
    default:
      return const Icon(Icons.close, color: Colors.white, size: 15); 
  }
}
}