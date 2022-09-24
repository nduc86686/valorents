import 'package:equatable/equatable.dart';

class AirBurstStats extends Equatable {
  int? shotgunPelletCount;
  double? burstDistance;

  AirBurstStats({this.shotgunPelletCount, this.burstDistance});

  @override
  // TODO: implement props
  List<Object?> get props => [shotgunPelletCount, burstDistance];
}