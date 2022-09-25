import 'package:equatable/equatable.dart';

class Abilities extends Equatable {
  final String? slot;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  const Abilities(
      {required this.slot,
        required this.displayName,
        required this.description,
        required this.displayIcon});

  @override
  // TODO: implement props
  List<Object?> get props => [slot, displayName, description, displayIcon];
}
