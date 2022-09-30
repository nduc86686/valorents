// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapModel _$MapModelFromJson(Map<String, dynamic> json) => MapModel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      coordinates: json['coordinates'] as String?,
      displayIcon: json['displayIcon'] as String?,
      listViewIcon: json['listViewIcon'] as String?,
      splash: json['splash'] as String?,
      assetPath: json['assetPath'] as String?,
      calloutsModel: (json['callouts'] as List<dynamic>?)
          ?.map((e) => CalloutsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mapUrl: json['mapUrl'] as String?,
    );

Map<String, dynamic> _$MapModelToJson(MapModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'coordinates': instance.coordinates,
      'displayIcon': instance.displayIcon,
      'listViewIcon': instance.listViewIcon,
      'splash': instance.splash,
      'assetPath': instance.assetPath,
      'mapUrl': instance.mapUrl,
      'callouts': instance.calloutsModel,
    };
