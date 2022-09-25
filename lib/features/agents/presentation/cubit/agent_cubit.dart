import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valo/features/agents/domain/entities/agents.dart';

import '../../../../src/core/usecase/usecase.dart';
import '../../domain/use_cases/agents_usecase.dart';
import 'agent_state.dart';

class AgentCubit extends Cubit<AgentsStates> {
  final AgentsUseCase agentsUseCase;

  AgentCubit({
    required this.agentsUseCase,
  }) : super(AgentsInitial());

  Future<List<Agent>?> getLeagues() async {
    emit(AgentsLoading());
    final agents = await agentsUseCase(NoParams());
    List<Agent> ?agent;
    agents.fold(
      (left) => emit(AgentssLoadFailure(left.message)),
      (right) {
        agent=right;
        emit(AgentsLoaded(agent!));
      },
    );
    return agent;
  }
}
