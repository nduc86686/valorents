import 'package:json_annotation/json_annotation.dart';
import 'package:valo/features/map/data/models/callouts_model.dart';
import 'package:valo/features/map/data/models/location_model.dart';
import 'package:valo/features/map/domain/entities/map.dart';

part 'map_model.g.dart';

@JsonSerializable()
class MapModel extends Maps {
  @JsonKey(name: 'callouts')
  final List<CalloutsModel> ?calloutsModel;

  const MapModel(
      {String? uuid,
      String? displayName,
      String? description,
      String? coordinates,
      String? displayIcon,
      String? listViewIcon,
      String? splash,
      String? assetPath,
      required this.calloutsModel,
      String? mapUrl})
      : super(
          uuid: uuid,
          displayName: displayName,
          displayIcon: displayIcon,
          coordinates: coordinates,
          listViewIcon: listViewIcon,
          callouts: calloutsModel,
          splash: splash,
          assetPath: assetPath,
          mapUrl: mapUrl,

        );

  factory MapModel.fromJson(Map<String, dynamic> json) =>
      _$MapModelFromJson(json);
}
