import 'package:json_annotation/json_annotation.dart';
import 'package:valo/features/map/domain/entities/callouts.dart';
import 'package:valo/features/map/domain/entities/location.dart';

import 'location_model.dart';

part 'callouts_model.g.dart';

@JsonSerializable()
class CalloutsModel extends Callouts {
  @JsonKey(name: 'location')
  final LocationModel locationModel;
  const CalloutsModel(
      {String? regionName, String? superRegionName, required this.locationModel})
      : super(
            regionName: regionName,
            superRegionName: superRegionName,
            location: locationModel);

  factory CalloutsModel.fromJson(Map<String, dynamic> json) =>
      _$CalloutsModelFromJson(json);
}
