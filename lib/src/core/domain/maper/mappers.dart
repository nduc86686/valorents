import '../../../../models/agent.dart';

extension StatusExtension on Agent {
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
