import 'pages/subhashchandrabose/subhash_timeline.dart';
import 'pages/chitaranjandas/chitudas.dart';
import 'pages/rabindranathtagore/rabindra.dart';
import 'pages/Bankimchandrachatterjee/bankim.dart';
import 'pages/kudirambose/khudiram.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Westbengal extends StatefulWidget {
  @override
  _WestbengalState createState() => _WestbengalState();
}

class _WestbengalState extends State<Westbengal> {
  final List<Map<String, dynamic>> freedomFighters = [
    {
      'name': 'Rabindranath Tagore',
      'image': 'assets/tagore.jpg',
      'page': RabindraTimeline()
    },
    {
      'name': 'Bankim Chandra Chatterjee',
      'image': 'assets/bankim.png',
      'page': BankimTimeline()
    },
    {
      'name': 'Subhash Chandra Bose',
      'image': 'assets/subhash.jpg',
      'page': SubhashTimeline(),
    },
    {
      'name': 'Khudiram Bose',
      'image': 'assets/khudiram.jpg',
      'page': KhudiramTimeline()
    },
    {
      'name': 'Chittaranjan Das',
      'image': 'assets/Das.jpg',
      'page': ChitaranjanTimeline()
    },
  ];

  List<Map<String, dynamic>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = freedomFighters;
  }

  void _filterSearchResults(String query) {
    setState(() {
      filteredList = freedomFighters
          .where((fighter) =>
              fighter['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Legends of Bengal",
          style: GoogleFonts.poppins(
            color: Color.fromARGB(255, 36, 110, 150),
            fontSize: MediaQuery.sizeOf(context).width < 600 ? 30 : 55,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 239, 193, 123),
        toolbarHeight: 100,
      ),

      // appBar: AppBar(
      //   title: Center(
      //     child: Text('Search Freedom Fighters'),
      //   ),
      //   backgroundColor: Colors.green,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () {
      //         showSearch(
      //           context: context,
      //           delegate: FreedomFighterSearchDelegate(
      //             freedomFighters: freedomFighters,
      //             onQueryChanged: _filterSearchResults,
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      filteredList.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    filteredList[index]['page'],
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(20),
                            width: 250,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 13, 102, 116),
                                      width: 3,
                                    ),
                                  ),
                                  child: Image.asset(
                                    filteredList[index]['image']!,
                                    alignment: Alignment.topCenter,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Text(
                                  filteredList[index]['name']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 17, 92, 85),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
