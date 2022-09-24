import 'package:equatable/equatable.dart';

class AdsStats extends Equatable {
  final dynamic zoomMultiplier;
  final dynamic fireRate;
  final dynamic runSpeedMultiplier;
  final dynamic burstCount;
  final dynamic firstBulletAccuracy;

  const AdsStats(
      {this.zoomMultiplier,
      this.fireRate,
      this.runSpeedMultiplier,
      this.burstCount,
      this.firstBulletAccuracy});

  @override
  // TODO: implement props
  List<Object?> get props => [
        zoomMultiplier,
        fireRate,
        runSpeedMultiplier,
        burstCount,
        firstBulletAccuracy
      ];
}
