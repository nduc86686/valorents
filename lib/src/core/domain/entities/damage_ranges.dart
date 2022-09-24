import 'package:equatable/equatable.dart';

class DamageRanges extends Equatable {
  dynamic rangeStartMeters;
  dynamic rangeEndMeters;
  dynamic headDamage;
  dynamic bodyDamage;
  dynamic legDamage;

  DamageRanges(
      {this.rangeStartMeters,
        this.rangeEndMeters,
        this.headDamage,
        this.bodyDamage,
        this.legDamage});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [rangeStartMeters, rangeEndMeters, headDamage, bodyDamage, legDamage];
}