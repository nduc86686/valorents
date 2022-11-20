import 'package:equatable/equatable.dart';

import 'Role.dart';
import 'abilities.dart';

class AgentDetails extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? developerName;
  final dynamic? characterTags;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? background;
  final List<String>? backgroundGradientColors;
  final String? assetPath;
  final bool? isFullPortraitRightFacing;
  final bool? isPlayableCharacter;
  final bool? isAvailableForTest;
  final bool? isBaseContent;
  final Role? role;
  final List<Abilities>? abilities;

  const AgentDetails({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.abilities,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        uuid,
        displayName,
        description,
        developerName,
        characterTags,
        displayIcon,
        displayIconSmall,
        bustPortrait,
        fullPortrait,
        fullPortraitV2,
        killfeedPortrait,
        background,
        backgroundGradientColors,
        assetPath,
        isFullPortraitRightFacing,
        isPlayableCharacter,
        isAvailableForTest,
        isBaseContent,
        role,
        abilities
      ];
}
