import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../src/core/usecase/usecase.dart';
import '../../../domain/entities/agents.dart';
import '../../../domain/use_cases/agents_detail_usecase.dart';

part 'detail_agents_state.dart';

class DetailAgentsCubit extends Cubit<DetailAgentsState> {
  final AgentsDetailsUseCase agentsUseCase;

  DetailAgentsCubit({required this.agentsUseCase})
      : super(DetailAgentsInitial());

  Future<Agent?> getDetailsAgent({String ?uuid}) async {
    // if(isClosed) return null;
    emit(DetailAgentsLoading());
    await Future.delayed(const Duration(seconds: 1));
    final agents = await agentsUseCase(Params(uuid: uuid));
    Agent? agent;
    agents.fold(
      (left) => emit(DetailAgentsLoadFailure(left.message)),
      (right) {
        agent = right;
        emit(DetailAgentsLoaded(agents: agent!));
      },
    );
    return agent;
  }
}
