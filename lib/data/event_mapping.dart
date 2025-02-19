import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class EventMapping {
  final String eventName;
  final GeoPoint geoPoint;
  final String eventStory;
  final String eventHeading;
  final String? eventImage;

  EventMapping({
    required this.eventName,
    required this.geoPoint,
    required this.eventStory,
    required this.eventHeading,
    this.eventImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'eventName': eventName,
      'geoPoint': geoPoint.toMap(),
      'eventStory': eventStory,
      'eventHeading': eventHeading,
      'eventImage': eventImage
    };
  }

  factory EventMapping.fromMap(Map<String, dynamic> map) {
    return EventMapping(
      eventName: map['eventName'] ?? '',
      geoPoint: GeoPoint.fromMap(map['geoPoint']),
      eventStory: map['eventStory'] ?? '',
      eventHeading: map['eventHeading'] ?? '',
      eventImage: map['eventImage'] ?? '',
    );
  }
}
