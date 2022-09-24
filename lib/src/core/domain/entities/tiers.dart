import 'package:equatable/equatable.dart';

class Tiers extends Equatable{
  int? tier;
  String? tierName;
  String? division;
  String? divisionName;
  String? color;
  String? backgroundColor;
  String? smallIcon;
  String? largeIcon;
  String? rankTriangleDownIcon;
  String? rankTriangleUpIcon;

  Tiers(
      {this.tier,
        this.tierName,
        this.division,
        this.divisionName,
        this.color,
        this.backgroundColor,
        this.smallIcon,
        this.largeIcon,
        this.rankTriangleDownIcon,
        this.rankTriangleUpIcon});

  @override
  // TODO: implement props
  List<Object?> get props => [tier,
    tierName,
    division,
    divisionName,
    color,
    backgroundColor,
    smallIcon,
    largeIcon,
    rankTriangleDownIcon,
    rankTriangleUpIcon];

}