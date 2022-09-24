// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsStatsModel _$AdsStatsModelFromJson(Map<String, dynamic> json) =>
    AdsStatsModel(
      zoomMultiplier: json['zoomMultiplier'],
      fireRate: json['fireRate'],
      runSpeedMultiplier: json['runSpeedMultiplier'],
      burstCount: json['burstCount'],
      firstBulletAccuracy: json['firstBulletAccuracy'],
    );

Map<String, dynamic> _$AdsStatsModelToJson(AdsStatsModel instance) =>
    <String, dynamic>{
      'zoomMultiplier': instance.zoomMultiplier,
      'fireRate': instance.fireRate,
      'runSpeedMultiplier': instance.runSpeedMultiplier,
      'burstCount': instance.burstCount,
      'firstBulletAccuracy': instance.firstBulletAccuracy,
    };
