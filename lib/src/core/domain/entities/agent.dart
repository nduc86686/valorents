import 'package:equatable/equatable.dart';

class Agent extends Equatable {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  List<Abilities>? abilities;

  Agent({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.abilities,
  });

  @override
  List<Object?> get props => [
        uuid,
        displayName,
        description,
        developerName,
        displayIcon,
        displayIconSmall,
        displayIconSmall,
        bustPortrait,
        fullPortrait,
        fullPortraitV2,
        killfeedPortrait,
        assetPath,
        isFullPortraitRightFacing,
        isPlayableCharacter,
        isAvailableForTest,
        isBaseContent,
        role,
        abilities,
      ];
}

class Role extends Equatable {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role(
      {this.uuid,
      this.displayName,
      this.description,
      this.displayIcon,
      this.assetPath});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [uuid, displayName, description, displayIcon, assetPath];
}

class Abilities extends Equatable {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({this.slot, this.displayName, this.description, this.displayIcon});

  @override
  // TODO: implement props
  List<Object?> get props => [slot, displayName, description, displayIcon];
}

class MediaList extends Equatable {
  int? id;
  String? wwise;
  String? wave;

  MediaList({this.id, this.wwise, this.wave});

  @override
  // TODO: implement props
  List<Object?> get props => [id, wwise, wave];
}
