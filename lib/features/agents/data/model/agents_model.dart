import 'package:json_annotation/json_annotation.dart';
import 'package:valo/features/agents/data/model/role_model.dart';
import 'package:valo/features/agents/domain/entities/agents.dart';
import 'abilities_model.dart';

part 'agents_model.g.dart';

@JsonSerializable()
class AgentModel extends Agent {
  @JsonKey(name: 'role')
  final RoleModel roleModel;
  @JsonKey(name: 'abilities')
  final List<AbilitiesModel> abilitiesModel;
  const AgentModel(
      {String? uuid,
        String? displayName,
        String? description,
        String? developerName,
        String? displayIcon,
        String? displayIconSmall,
        String? bustPortrait,
        String? fullPortrait,
        String? fullPortraitV2,
        String? killfeedPortrait,
        String? assetPath,
        bool? isFullPortraitRightFacing,
        bool? isPlayableCharacter,
        bool? isAvailableForTest,
        bool? isBaseContent,
        // @JsonKey(name: 'role', fromJson: _fromJsonList)
        required this.roleModel,
        required this.abilitiesModel})
      : super(
      description: description,
      displayName: displayName,
      displayIcon: displayIcon,
      uuid: uuid,
      assetPath: assetPath,
      role: roleModel,
      killfeedPortrait: killfeedPortrait,
      isPlayableCharacter: isPlayableCharacter,
      isFullPortraitRightFacing: isFullPortraitRightFacing,
      isBaseContent: isBaseContent,
      isAvailableForTest: isAvailableForTest,
      fullPortraitV2: fullPortraitV2,
      fullPortrait: fullPortrait,
      displayIconSmall: displayIconSmall,
      developerName: developerName,
      bustPortrait: bustPortrait,
      abilities: abilitiesModel);

  factory AgentModel.fromJson(Map<String, dynamic> json) =>
      _$AgentModelFromJson(json);
}