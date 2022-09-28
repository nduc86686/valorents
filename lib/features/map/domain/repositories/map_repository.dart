import 'package:dartz/dartz.dart';
import 'package:valo/features/map/domain/entities/map.dart';
import 'package:valo/src/core/error/error_handler.dart';

abstract class MapRepository{
  Future<Either<Failure,List<Maps>>> getMap();
}