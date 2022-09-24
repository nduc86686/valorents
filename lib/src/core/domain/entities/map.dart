// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:equatable/equatable.dart';

import 'entities.dart';


class Maps extends Equatable {
  String? uuid;
  String? displayName;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;
  List<Callouts>? callouts;

  Maps(
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




