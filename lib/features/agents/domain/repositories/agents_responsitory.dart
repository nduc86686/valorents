import 'package:dartz/dartz.dart';
import 'package:valo/features/agents/domain/entities/agents.dart';
import 'package:valo/src/core/error/error_handler.dart';


abstract class AgentsRepository {
  Future<Either<Failure, List<Agent>>> getAgents();
}