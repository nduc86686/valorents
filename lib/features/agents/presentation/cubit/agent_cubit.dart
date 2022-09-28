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

  Future<List<Agent>?> getAgents() async {
    emit(AgentsLoading());
    await Future.delayed(const Duration(seconds: 1));
    final agents = await agentsUseCase(NoParams());
    List<Agent> ?agent;
    agents.fold(
      (left) => emit(AgentssLoadFailure(left.message)),
      (right) {
        agent=right;
        emit(AgentsLoaded(agents: agent!,indexTab: 0));
      },
    );
    return agent;
  }

  int currentIndex=0;
  void changeTab({int? index,String ?role})async{
    final listAgent=await getAgents();

    if(role?.toLowerCase()=='all'){
      final listAgent=await getAgents();
      emit(AgentsLoaded().copyWith(indexTab: index,agents: listAgent));
    }
    else{
      final agent=listAgent?.where((element) => element.role?.displayName?.toLowerCase()==role?.toLowerCase()).toList();
      emit(AgentsLoaded().copyWith(indexTab: index,agents: agent));
    }

  }
}
