import 'package:valo/features/agents/domain/entities/agents.dart';

abstract class AgentsStates {}

class AgentsInitial extends AgentsStates {}

class AgentsLoading extends AgentsStates {}

class AgentsLoaded extends AgentsStates {
  final List<Agent> agents;

  AgentsLoaded(this.agents);
}

class AgentssLoadFailure extends AgentsStates {
  final String message;

  AgentssLoadFailure(this.message);
}
