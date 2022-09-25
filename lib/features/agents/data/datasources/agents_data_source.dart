import 'package:dio/dio.dart';


import '../../../../src/core/api/dio_helper.dart';
import '../model/agents_model.dart';


abstract class AgentsDataSource {
  Future<List<AgentModel>> getAgents();
}
class AgentsDataSourceImpl implements AgentsDataSource {
  final DioHelper dioHelper;

  AgentsDataSourceImpl({required this.dioHelper});

  @override
  Future<List<AgentModel>> getAgents() async {
    try {
    final response =
    await dioHelper.get(url: '/v1/agents',queryParams: {'isPlayableCharacter': true});
    print('resss ${response.data}');
    List<dynamic> result = response.data["data"];
    List<AgentModel> leagues = List<AgentModel>.from(result.map(
          (item) => AgentModel.fromJson(item),
    ));
    return leagues;
    } catch (error) {
    rethrow;
    }
  }

}

// List<SoccerFixtureModel> _getResult(Response response) {
//   List<dynamic> result = response.data["response"];
//   List<SoccerFixtureModel> fixtures = List<SoccerFixtureModel>.from(result.map(
//         (fixture) => SoccerFixtureModel.fromJson(fixture),
//   ));
//   return fixtures;
// }