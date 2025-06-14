import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legends_of_india/bengalfighter.dart';

class IndiaMapPage extends StatelessWidget {
  IndiaMapPage({super.key});
  // List of states with their coordinates (left, top positions) and corresponding pages
  final List<Map<String, dynamic>> stateCoordinates = [
    {'name': 'West Bengal', 'left': 150.0, 'top': 200.0, 'page': Westbengal()},
    // You can add more states with their coordinates and corresponding pages
    // Example: {'name': 'Maharashtra', 'left': 200.0, 'top': 250.0, 'page': MaharashtraPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 219, 221),
      appBar: AppBar(
        title: Text(
          "Legends of India",
          style: GoogleFonts.poppins(
            color: Color.fromARGB(255, 36, 110, 150),
            fontSize: MediaQuery.sizeOf(context).width < 600 ? 30 : 55,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 150, 213, 236),
        toolbarHeight: 100,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/india2.jpg", // Replace with your image
              fit: BoxFit.fill,
              color: const Color.fromARGB(
                255,
                0,
                78,
                100,
              ).withOpacity(0.1), // Adjust transparency
              colorBlendMode: BlendMode.dstATop, // Blend for transparency
            ),
          ),
          // Display the India map (SVG image)
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(
                16.0,
              ), // Add spacing around the text
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Us:",
                    style: GoogleFonts.spicyRice(
                      fontSize: 24,
                      color: const Color.fromARGB(255, 43, 104, 235),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ), // Spacing between title and description
                  Text(
                    "This is a project dedicated to reviving the inspiring life journeys of freedom fighters and artists from India (starting with Bengal) who enriched our country through their valour, literature, leadership, and art.",
                    style: GoogleFonts.merriweather(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5, // Line height for better readability
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.0),
                      child: Text(
                        "States",
                        style: GoogleFonts.spicyRice(
                          fontSize: 24,
                          color: const Color.fromARGB(255, 43, 104, 235),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text(
                        "West Bengal",
                        style: GoogleFonts.merriweatherSans(
                          fontSize: 25,
                          color: const Color.fromARGB(255, 1, 63, 94),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  // Row(
                  //     children: [
                  //       SingleChildScrollView(
                  // child:
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Westbengal()),
                      );
                    },
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 5, 125, 129),
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                          "assets/Wb.png",
                          colorBlendMode: BlendMode.darken,
                          height: 300,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 200,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 5, 125, 129),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Other states are coming soon !",
                            style: GoogleFonts.adamina(
                              color: Color.fromARGB(255, 0, 64, 94),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ),
                ],
              ),

              // ],
            ),
          ),
          // ),
          // Dynamically generate the clickable positions for each state
        ],
      ),
    );
  }
}
