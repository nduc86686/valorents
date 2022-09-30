import 'package:dio/dio.dart';


import '../../../../src/core/api/dio_helper.dart';
import '../models/map_model.dart';


abstract class MapDataSource {
  Future<List<MapModel>> getMap();
}
class MapsDataSourceImpl implements MapDataSource {
  final DioHelper dioHelper;

  MapsDataSourceImpl({required this.dioHelper});

  @override
  Future<List<MapModel>> getMap() async {
    try {
      final response =
      await dioHelper.get(url: '/v1/maps');
      List<dynamic> result = response.data["data"];
      List<MapModel> maps = List<MapModel>.from(result.map(
            (item) => MapModel.fromJson(item),
      ));
      return maps;
    } catch (error) {
      rethrow;
    }
  }

}
