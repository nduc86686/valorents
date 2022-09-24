import 'package:equatable/equatable.dart';

class AltShotgunStats extends Equatable {
  int? shotgunPelletCount;
  double? burstRate;

  AltShotgunStats({this.shotgunPelletCount, this.burstRate});

  @override
  // TODO: implement props
  List<Object?> get props => [shotgunPelletCount, burstRate];
}