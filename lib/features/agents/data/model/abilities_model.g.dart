// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abilities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilitiesModel _$AbilitiesModelFromJson(Map<String, dynamic> json) =>
    AbilitiesModel(
      slot: json['slot'] as String?,
      displayName: json['displayName'] as String?,
      description: json['description'] as String?,
      displayIcon: json['displayIcon'] as String?,
    );

Map<String, dynamic> _$AbilitiesModelToJson(AbilitiesModel instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'displayName': instance.displayName,
      'description': instance.description,
      'displayIcon': instance.displayIcon,
    };
