part of 'detail_agents_cubit.dart';

abstract class DetailAgentsState extends Equatable {
  const DetailAgentsState();
}

class DetailAgentsInitial extends DetailAgentsState {
  @override
  List<Object> get props => [];
}

class DetailAgentsLoading extends DetailAgentsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class DetailAgentsLoaded extends DetailAgentsState {
  final Agent ?agents;

  DetailAgentsLoaded({ this.agents});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DetailAgentsLoadFailure extends DetailAgentsState {
  final String message;

  DetailAgentsLoadFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
