import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'location.dart';

abstract class Callouts extends Equatable {
  final String? regionName;
  final String? superRegionName;
  final Location? location;

   const Callouts({this.regionName, this.superRegionName, this.location});


  @override
  // TODO: implement props
  List<Object?> get props => [regionName, superRegionName, location];
}