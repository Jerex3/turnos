// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turno.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Turno _$TurnoFromJson(Map<String, dynamic> json) => Turno(
      startAt: Turno.fromJsonTimestamp(json['startAt'] as Timestamp),
      createdAt: Turno.fromJsonTimestamp(json['createdAt'] as Timestamp),
      duration: json['duration'] as String,
      place: Place.fromJson(json['place'] as Map<String, dynamic>),
      persons: json['persons'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$TurnoToJson(Turno instance) => <String, dynamic>{
      'startAt': Turno.DateTimeToJson(instance.startAt),
      'createdAt': Turno.DateTimeToJson(instance.createdAt),
      'duration': instance.duration,
      'place': instance.place,
      'persons': instance.persons,
      'price': instance.price,
    };
