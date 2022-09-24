import 'package:equatable/equatable.dart';

class GridPosition extends Equatable {
  dynamic row;
  dynamic column;

  GridPosition({this.row, this.column});

  @override
  // TODO: implement props
  List<Object?> get props => [row, column];
}