import 'package:json_annotation/json_annotation.dart';
import 'package:valo/features/agents/domain/entities/role.dart';





part 'role_model.g.dart';

@JsonSerializable()
class RoleModel extends Role {
  const RoleModel({
    String? uuid,
    String? displayName,
    String? description,
    String? displayIcon,
    String? assetPath
  }) : super(
      assetPath: assetPath,
      uuid: uuid,
      displayIcon: displayIcon,
      displayName: displayName,
      description: description);

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}
