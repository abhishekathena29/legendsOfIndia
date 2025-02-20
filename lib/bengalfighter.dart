import 'package:legends_of_india/data/bankim_timeline.dart';
import 'package:legends_of_india/data/chitudas_timeline.dart';
import 'package:legends_of_india/data/khudiram_timeline.dart';
import 'package:legends_of_india/data/rabindra_timeline.dart';
import 'package:legends_of_india/data/subhash_timeline.dart';
import 'package:legends_of_india/pages/detail_view_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Westbengal extends StatefulWidget {
  const Westbengal({super.key});

  @override
  State<Westbengal> createState() => _WestbengalState();
}

class _WestbengalState extends State<Westbengal> {
  final List<Map<String, dynamic>> freedomFighters = [
    {
      'name': 'Rabindranath Tagore',
      'image': 'assets/tagore.jpg',
      'page': DetailMapViewPage(
        timelineEvents: rabindraTimelineEvents,
        freedomFighterName: 'Rabindra Nath Tagore',
      ),
    },
    {
      'name': 'Bankim Chandra Chatterjee',
      'image': 'assets/bankim.png',
      'page': DetailMapViewPage(
        timelineEvents: bankimTimelineEvents,
        freedomFighterName: 'Bankim Chandra Chatterjee',
      ),
    },
    {
      'name': 'Subhash Chandra Bose',
      'image': 'assets/subhash.jpg',
      'page': DetailMapViewPage(
        timelineEvents: subhashTimelineEvents,
        freedomFighterName: 'Subhash Chandra Bose',
      ),
    },
    {
      'name': 'Khudiram Bose',
      'image': 'assets/khudiram.jpg',
      'page': DetailMapViewPage(
        timelineEvents: khudiramTimelineEvents,
        freedomFighterName: 'Khudiram Bose',
      ),
    },
    {
      'name': 'Chittaranjan Das',
      'image': 'assets/Das.jpg',
      'page': DetailMapViewPage(
        timelineEvents: chitudasTimelineEvents,
        freedomFighterName: 'Chittaranjan Das',
      ),
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
      filteredList =
          freedomFighters
              .where(
                (fighter) => fighter['name']!.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
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
                    children: List.generate(filteredList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => filteredList[index]['page'],
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
                                      255,
                                      13,
                                      102,
                                      116,
                                    ),
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
                    }),
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
