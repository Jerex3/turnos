import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class GeoPointConverter implements JsonConverter<GeoPoint, Map<String, dynamic>> {
  GeoPointConverter();

  @override
  GeoPoint fromJson(Map<String, dynamic> json) {
    final latitude = json['latitude'] as double;
    final longitude = json['longitude'] as double;
    return GeoPoint(latitude, longitude);
  }

  @override
  Map<String, dynamic> toJson(GeoPoint geoPoint) {
    return {
      'latitude': geoPoint.latitude,
      'longitude': geoPoint.longitude,
    };
  }
}
