import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tnpd/domain/models/activity.dart';
import 'package:tnpd/domain/models/place.dart';

part 'turno.g.dart';

@JsonSerializable()
class Turno {
  
      Turno({
    required this.startAt,
    required this.createdAt,
    required this.duration,
    required this.place,
    required this.persons,
    required this.price
  });



  @JsonKey(fromJson: fromJsonTimestamp, toJson: DateTimeToJson)
  final DateTime startAt;
  @JsonKey(fromJson: fromJsonTimestamp, toJson: DateTimeToJson)
  final DateTime createdAt;
  
  final String duration;
  final Place place;
  final int persons;
  final double price;
  static Map<String, dynamic> DateTimeToJson(DateTime timestamp) {
    return {
      "seconds":timestamp.millisecondsSinceEpoch / 1000,
    };
  }

  static DateTime fromJsonTimestamp(Timestamp timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  }

  Map<String, dynamic> toJson() => _$TurnoToJson(this);

  factory Turno.fromJson(Map<String, dynamic> json) => _$TurnoFromJson(json);
}