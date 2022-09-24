import 'package:equatable/equatable.dart';

import 'entities.dart';


class Callouts extends Equatable {
  String? regionName;
  String? superRegionName;
  Location? location;

  Callouts({this.regionName, this.superRegionName, this.location});

  @override
  // TODO: implement props
  List<Object?> get props => [regionName, superRegionName, location];
}