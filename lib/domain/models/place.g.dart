// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      json['name'] as String,
      json['court'] as String,
      json['courtDescription'] as String,
      json['photo'] as String,
      Place.geoFromJson(json['ubication'] as GeoPoint),
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'name': instance.name,
      'court': instance.court,
      'courtDescription': instance.courtDescription,
      'photo': instance.photo,
      'ubication': Place.geoToJson(instance.ubication),
    };
