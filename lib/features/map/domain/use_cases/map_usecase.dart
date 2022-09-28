import 'package:dartz/dartz.dart';
import 'package:valo/features/map/domain/entities/map.dart';
import 'package:valo/src/core/error/error_handler.dart';
import 'package:valo/src/core/usecase/usecase.dart';

import '../repositories/map_repository.dart';

class MapUseCase implements UseCase<List<Maps>,NoParams>{
  final MapRepository mapRepository;
  MapUseCase({required this.mapRepository});
  @override
  Future<Either<Failure, List<Maps>>> call(NoParams params) {
    // TODO: implement call
    return mapRepository.getMap();
  }

}