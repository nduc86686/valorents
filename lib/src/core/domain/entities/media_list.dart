import 'package:equatable/equatable.dart';

class MediaList extends Equatable {
  int? id;
  String? wwise;
  String? wave;

  MediaList({this.id, this.wwise, this.wave});

  @override
  // TODO: implement props
  List<Object?> get props => [id, wwise, wave];
}