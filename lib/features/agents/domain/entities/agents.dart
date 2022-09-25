import 'package:equatable/equatable.dart';

import 'abilities.dart';
import 'role.dart';



class Agent extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? developerName;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? assetPath;
  final bool? isFullPortraitRightFacing;
  final bool? isPlayableCharacter;
  final bool? isAvailableForTest;
  final bool? isBaseContent;
  final Role? role;
  final List<Abilities>? abilities;

  const Agent({
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
