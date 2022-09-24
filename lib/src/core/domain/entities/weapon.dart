// ignore_for_file: prefer_void_to_null

import 'package:equatable/equatable.dart';
import 'package:valo/src/core/domain/entities/entities.dart';



class Weapon extends Equatable {
  String? uuid;
  String? displayName;
  String? category;
  String? defaultSkinUuid;
  String? displayIcon;
  String? killStreamIcon;
  String? assetPath;
  WeaponStats? weaponStats;
  ShopData? shopData;

  Weapon(
      {this.uuid,
      this.displayName,
      this.category,
      this.defaultSkinUuid,
      this.displayIcon,
      this.killStreamIcon,
      this.assetPath,
      this.weaponStats,
      this.shopData});

  @override
  // TODO: implement props
  List<Object?> get props => [
        uuid,
        displayName,
        category,
        defaultSkinUuid,
        displayIcon,
        killStreamIcon,
        assetPath,
        weaponStats,
        shopData
      ];
}


