import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/event_mapping.dart';

class DetailMapViewPage extends StatefulWidget {
  const DetailMapViewPage({
    super.key,
    required this.timelineEvents,
    required this.freedomFighterName,
  });

  final List<EventMapping> timelineEvents;
  final String freedomFighterName;

  @override
  State<DetailMapViewPage> createState() => _DetailMapViewPageState();
}

class _DetailMapViewPageState extends State<DetailMapViewPage> {
  // Example data for timeline and associated markers
  int currentIndex = 0;

  MapController _mapController = MapController(
    initPosition: GeoPoint(latitude: 20.4625, longitude: 85.8830),
  );

  @override
  void initState() {
    super.initState();
    _mapController = MapController(
      initPosition: GeoPoint(latitude: 20.4625, longitude: 85.8830),
    );
  }

  void _moveToNext() {
    setState(() {
      _mapController.removeMarker(widget.timelineEvents[currentIndex].geoPoint);
      currentIndex = (currentIndex + 1) % widget.timelineEvents.length;
      // Move the map to the new marker position
      _mapController.addMarker(
        widget.timelineEvents[currentIndex].geoPoint,
        markerIcon: const MarkerIcon(
          icon: Icon(Icons.place, color: Colors.black),
        ),
      );

      _mapController.moveTo(widget.timelineEvents[currentIndex].geoPoint);
    });
  }

  void _moveToprevious() {
    setState(() {
      _mapController.removeMarker(widget.timelineEvents[currentIndex].geoPoint);
      currentIndex = (currentIndex - 1) % widget.timelineEvents.length;
      _mapController.addMarker(
        widget.timelineEvents[currentIndex].geoPoint,
        markerIcon: const MarkerIcon(
          icon: Icon(Icons.place, color: Colors.black),
        ),
      );
      // Move the map to the new marker position
      _mapController.moveTo(widget.timelineEvents[currentIndex].geoPoint);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.freedomFighterName,
          style: GoogleFonts.poppins(
            color: Color.fromARGB(255, 36, 110, 150),
            fontSize: MediaQuery.sizeOf(context).width < 600 ? 25 : 55,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 150, 213, 236),
        toolbarHeight: 80,
      ),
      backgroundColor: Color.fromARGB(255, 250, 235, 213),
      body: Column(
        children: [
          // Timeline at the top
          SizedBox(
            height: 150, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.timelineEvents.length,
              itemBuilder: (context, index) {
                return TimelineTile(
                  axis: TimelineAxis.horizontal,
                  alignment: TimelineAlign.center,
                  isFirst: index == 0,
                  isLast: index == widget.timelineEvents.length - 1,
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
                      widget.timelineEvents[index].eventName,
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
                          timelineEvents: widget.timelineEvents,
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
                                widget.timelineEvents[currentIndex].eventHeading
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
                            if (widget
                                    .timelineEvents[currentIndex]
                                    .eventImage !=
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
                                child: CachedNetworkImage(
                                  imageUrl:
                                      widget
                                          .timelineEvents[currentIndex]
                                          .eventImage
                                          .toString(),
                                  height: 180,
                                ),
                              ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.0, left: 15.0),
                              child: Text(
                                ' ${widget.timelineEvents[currentIndex].eventStory}',
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
                          timelineEvents: widget.timelineEvents,
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
                                    widget
                                        .timelineEvents[currentIndex]
                                        .eventHeading
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
                                if (widget
                                        .timelineEvents[currentIndex]
                                        .eventImage !=
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
                                      widget
                                          .timelineEvents[currentIndex]
                                          .eventImage
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
                                    widget
                                        .timelineEvents[currentIndex]
                                        .eventStory,
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
