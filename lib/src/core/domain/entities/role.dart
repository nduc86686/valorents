import 'package:equatable/equatable.dart';

class Role extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? displayIcon;
  final String? assetPath;

  const Role(
      {this.uuid,
      this.displayName,
      this.description,
      this.displayIcon,
      this.assetPath});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [uuid, displayName, description, displayIcon, assetPath];
}
