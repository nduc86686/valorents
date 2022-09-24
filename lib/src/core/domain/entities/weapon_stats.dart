import 'package:equatable/equatable.dart';

import 'entities.dart';

class WeaponStats extends Equatable {
  dynamic fireRate;
  dynamic magazineSize;
  dynamic runSpeedMultiplier;
  dynamic equipTimeSeconds;
  dynamic reloadTimeSeconds;
  dynamic firstBulletAccuracy;
  dynamic shotgunPelletCount;
  String? wallPenetration;
  String? feature;
  String? fireMode;
  String? altFireType;
  AdsStats? adsStats;
  AltShotgunStats? altShotgunStats;
  AirBurstStats? airBurstStats;
  List<DamageRanges>? damageRanges;

  WeaponStats(
      {this.fireRate,
      this.magazineSize,
      this.runSpeedMultiplier,
      this.equipTimeSeconds,
      this.reloadTimeSeconds,
      this.firstBulletAccuracy,
      this.shotgunPelletCount,
      this.wallPenetration,
      this.feature,
      this.fireMode,
      this.altFireType,
      this.adsStats,
      this.altShotgunStats,
      this.airBurstStats,
      this.damageRanges});

  @override
  // TODO: implement props
  List<Object?> get props => [
        fireRate,
        magazineSize,
        runSpeedMultiplier,
        equipTimeSeconds,
        reloadTimeSeconds,
        firstBulletAccuracy,
        shotgunPelletCount,
        wallPenetration,
        feature,
        fireMode,
        altFireType,
        adsStats,
        altShotgunStats,
        airBurstStats,
        damageRanges
      ];
}
