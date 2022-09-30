import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:valo/features/agents/domain/entities/agents.dart';
import 'package:valo/features/map/domain/entities/map.dart';
import 'package:valo/features/map/domain/repositories/map_repository.dart';
import 'package:valo/src/core/error/error_handler.dart';

import '../../../../src/core/error/response_status.dart';
import '../../../../src/core/network/net_work_info.dart';
import '../data_sources/map_data_source.dart';


class MapsRepositoryImpl implements MapRepository {
  final MapDataSource mapDataSource;
  final NetworkInfo networkInfo;

  MapsRepositoryImpl({
    required this.mapDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Maps>>> getMap() async {
    // TODO: implement getMap
    if (await networkInfo.isConnected) {
      try {
        final result = await mapDataSource.getMap();
        return Right(result);
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

}