import 'package:equatable/equatable.dart';

class Location extends Equatable {
  var x;
  var y;

  Location({this.x, this.y});

  @override
  // TODO: implement props
  List<Object?> get props => [x, y];
}
