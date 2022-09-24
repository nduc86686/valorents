import 'package:json_annotation/json_annotation.dart';

import '../domain/entities/entities.dart';

part 'abilities.g.dart';

@JsonSerializable()
class AbilitiesModel extends Abilities {
  const AbilitiesModel({
    String? slot,
    String? displayName,
    String? description,
    String? displayIcon,
  }) : super(
            slot: slot,
            displayIcon: displayIcon,
            displayName: displayName,
            description: description);

  factory AbilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesModelFromJson(json);
}
