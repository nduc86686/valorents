import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:valo/features/agents/domain/entities/agents.dart';
import 'package:valo/src/core/error/error_handler.dart';

import '../../../../src/core/error/response_status.dart';
import '../../../../src/core/network/net_work_info.dart';
import '../../domain/repositories/agents_responsitory.dart';
import '../datasources/agents_data_source.dart';


class AgentsRepositoryImpl implements AgentsRepository {
  final AgentsDataSource agentsDataSource;
  final NetworkInfo networkInfo;

  AgentsRepositoryImpl({
    required this.agentsDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Agent>>> getAgents() async{
    // TODO: implement getAgents
    if (await networkInfo.isConnected) {
      try {
        final result = await agentsDataSource.getAgents();
        return Right(result);
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

}