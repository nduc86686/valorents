import 'package:equatable/equatable.dart';

import 'callouts.dart';

class Maps extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? coordinates;
  final String? displayIcon;
  final String? listViewIcon;
  final String? splash;
  final String? assetPath;
  final String? mapUrl;
  final List<Callouts>? callouts;

  const Maps(
      {this.uuid,
      this.displayName,
      this.coordinates,
      this.displayIcon,
      this.listViewIcon,
      this.splash,
      this.assetPath,
      this.mapUrl,
      this.callouts});

  @override
  // TODO: implement props
  List<Object?> get props => [
        uuid,
        displayName,
        coordinates,
        displayIcon,
        listViewIcon,
        splash,
        assetPath,
        mapUrl,
        callouts
      ];
}
