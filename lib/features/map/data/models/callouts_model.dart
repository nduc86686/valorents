import 'package:valo/features/map/domain/entities/callouts.dart';
import 'package:valo/features/map/domain/entities/location.dart';

class CalloutsModel extends Callouts {
  // String? regionName;
  // String? superRegionName;
  // Location? location;
  //
  // CalloutsModel({this.regionName, this.superRegionName, this.location});
  const CalloutsModel(
      {String? regionName, String? superRegionName, Location? location})
      : super(
            regionName: regionName,
            superRegionName: superRegionName,
            location: location);

}
