import '../entities/entities.dart';

extension AgenExtension on Agent {
  Agent toDomain() => Agent(
      description: description,
      abilities: abilities,
      assetPath: assetPath,
      bustPortrait: bustPortrait,
      developerName: developerName,
      displayIcon: displayIcon,
      displayIconSmall: displayIconSmall,
      displayName: displayName,
      fullPortrait: fullPortrait,
      fullPortraitV2: fullPortraitV2,
      isAvailableForTest: isAvailableForTest,
      isBaseContent: isBaseContent,
      isFullPortraitRightFacing: isFullPortraitRightFacing,
      isPlayableCharacter: isPlayableCharacter,
      killfeedPortrait: killfeedPortrait,
      role: role,
      uuid: uuid);
}

extension AbilitiesExtension on Abilities {
  Abilities toDomain() => Abilities(
      displayName: displayName,
      displayIcon: displayIcon,
      description: description,
      slot: slot);
}

extension AdsStartExtension on AdsStats {
  AdsStats toDomain() => AdsStats(
      burstCount: burstCount,
      fireRate: fireRate,
      firstBulletAccuracy: firstBulletAccuracy,
      runSpeedMultiplier: runSpeedMultiplier,
      zoomMultiplier: zoomMultiplier);
}

extension AirBurstStatsExtension on AirBurstStats {
  AirBurstStats toDomain() => AirBurstStats(
      burstDistance: burstDistance, shotgunPelletCount: shotgunPelletCount);
}

extension AltShotgunStatsExtension on AltShotgunStats {
  AltShotgunStats toDomain() => AltShotgunStats(
      shotgunPelletCount: shotgunPelletCount, burstRate: burstRate);
}

extension CalloutsExtension on Callouts {
  Callouts toDomain() => Callouts(
      location: location,
      regionName: regionName,
      superRegionName: superRegionName);
}

extension DamageRangesExtension on DamageRanges {
  DamageRanges toDomain() => DamageRanges(
      bodyDamage: bodyDamage,
      headDamage: headDamage,
      legDamage: legDamage,
      rangeEndMeters: rangeEndMeters,
      rangeStartMeters: rangeStartMeters);
}

extension GridPositionExtension on GridPosition {
  GridPosition toDomain() => GridPosition(column: column, row: row);
}

extension LocationExtension on Location {
  Location toDomain() => Location(x: x, y: y);
}

extension MediaListExtension on MediaList {
  MediaList toDomain() => MediaList(id: id, wave: wave, wwise: wwise);
}

extension RankExtension on Rank {
  Rank toDomain() => Rank(
      uuid: uuid,
      assetPath: assetPath,
      assetObjectName: assetObjectName,
      tiers: tiers);
}

extension RoleExtension on Role {
  Role toDomain() => Role(
      assetPath: assetPath,
      uuid: uuid,
      description: description,
      displayIcon: displayIcon,
      displayName: displayName);
}

extension ShopDataExtension on ShopData {
  ShopData toDomain() => ShopData(
      assetPath: assetPath,
      category: category,
      image: image,
      canBeTrashed: canBeTrashed,
      categoryText: categoryText,
      cost: cost,
      gridPosition: gridPosition,
      newImage2: newImage2,
      newImage: newImage);
}

extension WeaponExtension on Weapon {
  Weapon toDomain() => Weapon(
      category: category,
      assetPath: assetPath,
      displayName: displayName,
      displayIcon: displayIcon,
      uuid: uuid,
      defaultSkinUuid: defaultSkinUuid,
      killStreamIcon: killStreamIcon,
      shopData: shopData,
      weaponStats: weaponStats);
}

extension WeaponStatsExtension on WeaponStats {
  WeaponStats toDomain() => WeaponStats(
      shotgunPelletCount: shotgunPelletCount,
      runSpeedMultiplier: runSpeedMultiplier,
      firstBulletAccuracy: firstBulletAccuracy,
      fireRate: fireRate,
      adsStats: adsStats,
      airBurstStats: airBurstStats,
      altFireType: altFireType,
      altShotgunStats: altShotgunStats,
      damageRanges: damageRanges,
      equipTimeSeconds: equipTimeSeconds,
      feature: feature,
      fireMode: fireMode,
      magazineSize: magazineSize,
      reloadTimeSeconds: reloadTimeSeconds,
      wallPenetration: wallPenetration);
}
