import '../../data/event_mapping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class KhudiramTimeline extends StatefulWidget {
  @override
  _KhudiramTimelineState createState() => _KhudiramTimelineState();
}

class _KhudiramTimelineState extends State<KhudiramTimeline> {
  // Example data for timeline and associated markers
  List<EventMapping> timelineEvents = [
    EventMapping(
      eventName: '3 December 1889',
      eventHeading: "Birth of Khudiram Bose ",
      geoPoint: GeoPoint(latitude: 22.4253, longitude: 87.308),
      eventImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfIPycjqAD9m1D97n59F7AOMqS5egPf1QU2Q&s",
      eventStory:
          "On 3rd December 1889 Khudiram Bose was born in the village of Habibpur in the Midnapore district (now in West Bengal, India).This village in Bengal was known for its nationalist sentiments, and it became the birthplace of one of India’s youngest revolutionaries. His parents were Trailokyanath Bose and Lakshmipriya Devi. Khudiram, the fourth child of his parents, was named after the cultural custom 'Khud', followed to protect him after his two elder brothers died prematurely. In this tradition, a newborn was symbolically sold to the eldest sister for three handfuls of grain. This practice was believed to safeguard the child from an early death.",
    ),
    EventMapping(
      eventName: '1895-1896',
      eventHeading: "Khudiram Bose loses his parents",
      geoPoint: GeoPoint(latitude: 22.4253, longitude: 87.308),
      eventStory:
          "Khudiram's life was marked by personal tragedy at a young age. He lost his mother Lakshmipriya Devi when he was just six years old, followed by the death of his father, Trailokyanath Bose, a year later. Left orphaned, Khudiram was raised by his elder sister, Aparupa Roy, and her husband, Amritalal Roy. They took him in and provided a stable home in Hatgachha village, which was a turning point in his life.",
    ),
    EventMapping(
      eventName: 'around 1896-1900',
      eventHeading: "Admission in Hamilton high School",
      geoPoint: GeoPoint(latitude: 22.29, longitude: 87.923),
      eventStory:
          "Khudiram was enrolled in Hamilton High School in Tamluk by his brother-in-law Amritalal Roy. During this time, he began to absorb nationalist ideas. He attended public meetings where revolutionaries spoke, planting the seeds of his patriotic zeal. His early education exposed him to India's growing resistance against British rule.",
      eventImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBau-gfCNH3N6f1_r6od9biTAbeRWdX_tDqQ&s",
    ),
    EventMapping(
      eventName: '1902-1903',
      eventHeading: "First Exposure to revolutionary ideas",
      geoPoint: GeoPoint(latitude: 22.4257, longitude: 87.3199),
      eventStory:
          "At the age of 13, Khudiram became involved with nationalist movements in Bengal. He was particularly influenced by leaders like Sri Aurobindo and Sister Nivedita. Through their speeches, Khudiram developed a passionate desire to see India free from British colonial rule. This period marked his first exposure to the growing revolutionary wave in Bengal, which would later define his life’s purpose.",
      eventImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc5MBC0-Bhbnb2CF4glrASAVNUEU6JvVBLzQ&s",
    ),
    EventMapping(
      eventName: '1905',
      eventHeading: "Khudiram joins the Anushilan Samiti",
      geoPoint: GeoPoint(latitude: 22.5744, longitude: 88.3629),
      eventStory:
          "At the young age of 15, Khudiram joined the Anushilan Samiti, a secret revolutionary group committed to Indian independence through armed struggle and came into contact with the network of Barindra Kumar Ghosh of Kolkata. His involvement in the Samiti included distributing anti-British literature, preparing bombs, and actively participating in resistance activities. This was a significant step in his life as it marked his formal entry into the revolutionary movement. (However some historians argue that he joined the Samiti in 1908 )",
      eventImage:
          "https://images.tv9hindi.com/wp-content/uploads/2024/08/khudiram-bose-1.jpeg?w=1280",
    ),
    EventMapping(
      eventName: '1906',
      eventHeading: "First Arrest ",
      geoPoint: GeoPoint(latitude: 22.5046, longitude: 87.4604),
      eventStory:
          "At the age of 16, Khudiram was arrested for the first time for distributing revolutionary pamphlets in paschim medinipur district (West Bengal), which were critical of British rule. His arrest was a pivotal moment, strengthening his resolve. His brief imprisonment only served to deepen his commitment to the freedom struggle, and he continued to engage in acts of resistance. Khudiram did not pursue formal higher education due to his intense involvement in revolutionary activities. At 18, he was fully immersed in the fight for India’s freedom, making his mark as one of the youngest revolutionaries involved in significant acts of resistance. At a very young age, he took part in planting bombs near police stations and targeted government officials.",
    ),
    EventMapping(
      eventName: 'April 30, 1908',
      eventHeading: "The Muzaffarpur Bombing",
      geoPoint: GeoPoint(latitude: 26.1197, longitude: 85.3910),
      eventStory:
          "Khudiram, along with fellow revolutionary Prafulla Chaki, carried out a bombing attempt on Magistrate Douglas Kingsford in Muzaffarpur, Bihar. Kingsford was known for his harsh judgments against Indian nationalists. The bomb was intended for his carriage, but tragically, the explosion killed Mrs. Kennedy and her daughter, two British women, instead of Kingsford. This failed attempt led to heightened tensions and increased scrutiny of nationalist activities in the region. While Prafulla committed suicide to avoid capture, Khudiram Bose was arrested.",
      eventImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl3kUSUyHpz_q6OQ9vNsFS3QNFuVq2dxgVVA&s",
    ),
    EventMapping(
      eventName: 'May - June , 1908',
      eventHeading: "Trial and Conviction ",
      geoPoint: GeoPoint(latitude: 26.1197, longitude: 85.3910),
      eventStory:
          "Khudiram was put on trial on May 21 , 1908 for his involvement in the Muzaffarpur conspiracy. Despite being just 18, he displayed remarkable composure during the trial. He accepted full responsibility for the bombing and did not show remorse for his actions, which only elevated his stature as a brave young revolutionary in the eyes of the Indian public. His conviction was swift, and he was sentenced to death by hanging.",
      eventImage:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Revolutionary%2C_Khudiram_Bose_as_a_captive.jpg/220px-Revolutionary%2C_Khudiram_Bose_as_a_captive.jpg",
    ),
    EventMapping(
      eventName: 'August 11, 1908',
      eventHeading: "Execution and death of Khudiram Bose",
      geoPoint: GeoPoint(latitude: 26.1197, longitude: 85.3910),
      eventStory:
          "Despite the combined efforts of several lawyers on August 11, 1908, Khudiram Bose was executed by hanging in Muzaffarpur Jail. At the age of 18, he became one of the youngest martyrs of India’s freedom struggle. His execution, coupled with his bravery and defiance in the face of death, made him a symbol of youthful resistance. Before his death, Khudiram reportedly shouted 'Vande Mataram', a powerful slogan that became a rallying cry for the Indian independence movement.",
      eventImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT25TdflX2U1AV4ILAmXPtJaQmejD-z_6UDQQ&s",
    ),
    EventMapping(
      eventName: 'Post 1908',
      eventHeading: "Legacy of Khudiram Bose",
      geoPoint: GeoPoint(latitude: 22.5744, longitude: 88.3629),
      eventStory:
          "Khudiram's death deeply impacted the Indian nationalist movement. His youthful courage and commitment to the cause of India's independence turned him into a martyr and an enduring symbol of the struggle against British rule. His story was widely disseminated and became a source of inspiration for generations of revolutionaries. Khudiram’s sacrifice contributed to the growing momentum for India's independence, and his legacy was honored in numerous ways: Khudiram Bose Central College in Kolkata , Shahid Khudiram Station (Kolkata Metro), Khudiram Bose Hospital,  Kolkata  , Khudiram Bose Memorial Central Jail, Muzaffarpur,  Khudiram Bose Pusa Railway Station, Memorials dedicated to him in Kolkata, Medinipur, and elsewhere.",
      eventImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPoXEQ7nRK1eMhMNOKrdliYCLIk5XSAwaB7Q&s",
    ),
  ];

  int currentIndex = 0;
  MapController _mapController = MapController(
    initPosition: GeoPoint(latitude: 22.3716, longitude: 87.4991),
  );

  @override
  void initState() {
    super.initState();
    _mapController = MapController(
      initPosition: GeoPoint(latitude: 22.3716, longitude: 87.4991),
    );
  }

  void _moveToNext() {
    setState(() {
      _mapController.removeMarker(timelineEvents[currentIndex].geoPoint);

      currentIndex = (currentIndex + 1) % timelineEvents.length;
      // Move the map to the new marker position
      _mapController.addMarker(
        timelineEvents[currentIndex].geoPoint,
        markerIcon: const MarkerIcon(
          icon: Icon(Icons.place, color: Colors.black),
        ),
      );

      _mapController.moveTo(timelineEvents[currentIndex].geoPoint);
    });
  }

  void _moveToprevious() {
    setState(() {
      _mapController.removeMarker(timelineEvents[currentIndex].geoPoint);
      currentIndex = (currentIndex - 1) % timelineEvents.length;
      _mapController.addMarker(
        timelineEvents[currentIndex].geoPoint,
        markerIcon: const MarkerIcon(
          icon: Icon(Icons.place, color: Colors.black),
        ),
      );
      // Move the map to the new marker position
      _mapController.moveTo(timelineEvents[currentIndex].geoPoint);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 235, 213),
      body: Column(
        children: [
          // Timeline at the top
          SizedBox(
            height: 150, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: timelineEvents.length,
              itemBuilder: (context, index) {
                return TimelineTile(
                  axis: TimelineAxis.horizontal,
                  alignment: TimelineAlign.center,
                  isFirst: index == 0,
                  isLast: index == timelineEvents.length - 1,
                  beforeLineStyle: const LineStyle(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  afterLineStyle: const LineStyle(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    height: 20,
                    indicator: _Indicator(isCurrent: currentIndex == index),
                  ),
                  startChild: Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(
                      timelineEvents[index].eventName,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ), // OpenStreetMap (OSM) in the middle

          // Map
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                if (constraint.maxWidth < 600) {
                  return ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        child: MapViewWidget(
                          mapController: _mapController,
                          timelineEvents: timelineEvents,
                          currentIndex: currentIndex,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 25.0),
                              child: Text(
                                timelineEvents[currentIndex].eventHeading
                                    .toUpperCase(),
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  color: Color.fromARGB(255, 17, 92, 85),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            if (timelineEvents[currentIndex].eventImage != null)
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
                                child: Image.network(
                                  timelineEvents[currentIndex].eventImage
                                      .toString(),
                                  height: 180,
                                ),
                              ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.0, left: 15.0),
                              child: Text(
                                ' ${timelineEvents[currentIndex].eventStory}',
                                style: GoogleFonts.merriweather(fontSize: 17),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            ElevatedButton(
                              onPressed: _moveToNext,
                              child: const Text('Next'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: ElevatedButton(
                                onPressed: _moveToprevious,
                                child: const Text('Previous'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                        child: MapViewWidget(
                          mapController: _mapController,
                          timelineEvents: timelineEvents,
                          currentIndex: currentIndex,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 25.0),
                                  child: Text(
                                    timelineEvents[currentIndex].eventHeading
                                        .toUpperCase(),
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Color.fromARGB(255, 17, 92, 85),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                if (timelineEvents[currentIndex].eventImage !=
                                    null)
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
                                    child: Image.network(
                                      timelineEvents[currentIndex].eventImage
                                          .toString(),
                                      height: 180,
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 30.0,
                                    left: 15.0,
                                  ),
                                  child: Text(
                                    ' ${timelineEvents[currentIndex].eventStory}',
                                    style: GoogleFonts.merriweather(
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                ElevatedButton(
                                  onPressed: _moveToNext,
                                  child: const Text('Next'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: ElevatedButton(
                                    onPressed: _moveToprevious,
                                    child: const Text('Previous'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),

          // Information and Next button
        ],
      ),
    );
  }
}

class MapViewWidget extends StatelessWidget {
  const MapViewWidget({
    super.key,
    required MapController mapController,
    required this.timelineEvents,
    required this.currentIndex,
  }) : _mapController = mapController;

  final MapController _mapController;
  final List<EventMapping> timelineEvents;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: _mapController,
      osmOption: const OSMOption(
        zoomOption: ZoomOption(
          initZoom: 12,
          minZoomLevel: 3,
          maxZoomLevel: 19,
          stepZoom: 1.0,
        ),
      ),
      onMapIsReady: (isReady) {
        if (isReady) {
          _mapController.addMarker(
            timelineEvents[currentIndex].geoPoint,
            markerIcon: const MarkerIcon(
              icon: Icon(Icons.place, color: Colors.black),
            ),
          );
          _mapController.moveTo(timelineEvents[currentIndex].geoPoint);
        }
      },
    );
  }
}

class _Indicator extends StatelessWidget {
  final bool isCurrent;

  const _Indicator({required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrent ? Colors.teal[300] : Colors.lightGreen[300],
      ),
    );
  }
}
