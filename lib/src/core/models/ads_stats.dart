import 'package:json_annotation/json_annotation.dart';

import '../domain/entities/entities.dart';

part 'ads_stats.g.dart';

@JsonSerializable()
class AdsStatsModel extends AdsStats {
  const AdsStatsModel({
    dynamic zoomMultiplier,
    dynamic fireRate,
    dynamic runSpeedMultiplier,
    dynamic burstCount,
    dynamic firstBulletAccuracy,
  }) : super(
            fireRate: fireRate,
            firstBulletAccuracy: firstBulletAccuracy,
            runSpeedMultiplier: runSpeedMultiplier,
            zoomMultiplier: zoomMultiplier,
            burstCount: burstCount);

  factory AdsStatsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsStatsModelFromJson(json);
}
