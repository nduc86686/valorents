import 'package:valo/container_injector.dart';

import '../../src/core/api/dio_helper.dart';
import '../../src/core/network/net_work_info.dart';
import 'data/datasources/agents_data_source.dart';
import 'data/repositories/agents_repository_impl.dart';
import 'domain/use_cases/agents_usecase.dart';

void initFixture() {
  sl.registerLazySingleton<AgentsDataSourceImpl>(
    () => AgentsDataSourceImpl(dioHelper: sl<DioHelper>()),
  );
  sl.registerLazySingleton(
    () => AgentsRepositoryImpl(
      networkInfo: sl<NetworkInfoImpl>(),
      agentsDataSource: sl<AgentsDataSourceImpl>(),
    ),
  );
  sl.registerLazySingleton(
    () => AgentsUseCase(aentsRepository: sl<AgentsRepositoryImpl>()),
  );
}
