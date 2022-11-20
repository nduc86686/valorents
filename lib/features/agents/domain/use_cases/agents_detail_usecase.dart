import 'package:dartz/dartz.dart';
import 'package:valo/src/core/error/error_handler.dart';

import '../../../../src/core/usecase/usecase.dart';
import '../entities/agents.dart';
import '../repositories/agents_responsitory.dart';

class AgentsDetailsUseCase implements UseCase<Agent, Params> {
  final AgentsRepository aentsRepository;

  AgentsDetailsUseCase({required this.aentsRepository});

  @override
  Future<Either<Failure, Agent>> call(Params params) {
    // TODO: implement call
    return aentsRepository.detailAgents(uuid: params.uuid);
  }
}

class Params {
  String? uuid;

  Params({this.uuid});
}
