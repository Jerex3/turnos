import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tnpd/domain/converter/geopoint_converter.dart';
part 'place.g.dart';
@JsonSerializable()
class Place {

  Place(this.name, this.court, this.courtDescription, this.photo, this.ubication);

  final String name;
  final String court;
  final String courtDescription;
  final String photo;

  @JsonKey(name:"ubication", fromJson: geoFromJson, toJson: geoToJson)
  final GeoPoint ubication;

  static GeoPoint geoFromJson(GeoPoint json) {
    return json;
  }

  static Map<String, dynamic> geoToJson(GeoPoint geoPoint) {
    return {
      'latitude': geoPoint.latitude,
      'longitude': geoPoint.longitude,
    };
  }

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceToJson(this);

}