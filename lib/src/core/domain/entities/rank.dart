import 'package:equatable/equatable.dart';
import 'package:valo/models/rank.dart';

class Rank extends Equatable {
  String? uuid;
  String? assetObjectName;
  List<Tiers>? tiers;
  String? assetPath;

  Rank({this.uuid, this.assetObjectName, this.tiers, this.assetPath});

  @override
  // TODO: implement props
  List<Object?> get props => [uuid, assetObjectName, tiers, assetPath];
}


