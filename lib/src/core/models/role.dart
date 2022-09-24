import 'package:json_annotation/json_annotation.dart';

import '../domain/entities/entities.dart';

part 'role.g.dart';

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
