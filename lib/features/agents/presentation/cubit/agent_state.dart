import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:valo/features/agents/domain/entities/agents.dart';
part 'agent_state.g.dart';
abstract class AgentsStates {}

class AgentsInitial extends AgentsStates {}

class AgentsLoading extends AgentsStates {}

@CopyWith()
class AgentsLoaded extends AgentsStates {
  final List<Agent> ?agents;
  final int ?indexTab;
   AgentsLoaded({ this.agents, this.indexTab});
}

class AgentssLoadFailure extends AgentsStates {
  final String message;

  AgentssLoadFailure(this.message);
}
