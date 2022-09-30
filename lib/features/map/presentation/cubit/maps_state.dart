part of 'maps_cubit.dart';

@immutable
abstract class MapsState {}

class MapsInitial extends MapsState {}

class MapsLoading extends MapsState {}

class MapsLoaed extends MapsState {
  final List<Maps>? maps;

  MapsLoaed({this.maps});
}

class MapsFail extends MapsState {}
