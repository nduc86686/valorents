import 'package:json_annotation/json_annotation.dart';
import 'package:valo/features/map/domain/entities/map.dart';

part 'map_model.g.dart';

@JsonSerializable()
class MapModel extends Maps {
  const MapModel(
      {String? uuid,
      String? displayName,
      String? description,
      String? coordinates,
      String? displayIcon,
      String? listViewIcon,
      String? splash,
      String? assetPath,
      String? mapUrl,
      List<Callouts>? callouts})
      : super(
          uuid: uuid,
          displayName: displayName,
          displayIcon: displayIcon,
          coordinates: coordinates,
          listViewIcon: listViewIcon,
          callouts: callouts,
          splash: splash,
          assetPath: assetPath,
          mapUrl: mapUrl,
        );

  factory MapModel.fromJson(Map<String, dynamic> json) =>
      _$MapModelFromJson(json);
}
