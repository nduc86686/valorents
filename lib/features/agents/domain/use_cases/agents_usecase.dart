import 'package:dartz/dartz.dart';
import 'package:valo/features/agents/domain/entities/agents.dart';
import 'package:valo/src/core/error/error_handler.dart';


import '../../../../src/core/usecase/usecase.dart';
import '../repositories/agents_responsitory.dart';


class AgentsUseCase implements UseCase<List<Agent>, NoParams> {
  final AgentsRepository aentsRepository;

  AgentsUseCase({required this.aentsRepository});

  @override
  Future<Either<Failure, List<Agent>>> call(NoParams) {
    // TODO: implement call
    return aentsRepository.getAgents();
  }


}