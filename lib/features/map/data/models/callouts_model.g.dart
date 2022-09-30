// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callouts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalloutsModel _$CalloutsModelFromJson(Map<String, dynamic> json) =>
    CalloutsModel(
      regionName: json['regionName'] as String?,
      superRegionName: json['superRegionName'] as String?,
      locationModel:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CalloutsModelToJson(CalloutsModel instance) =>
    <String, dynamic>{
      'regionName': instance.regionName,
      'superRegionName': instance.superRegionName,
      'location': instance.locationModel,
    };
