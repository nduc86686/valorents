import 'package:valo/container_injector.dart';
import 'package:valo/features/agents/presentation/cubit/agent_cubit.dart';
import 'package:valo/features/agents/presentation/cubit/detail_agent_cubit/detail_agents_cubit.dart';

import '../../src/core/api/dio_helper.dart';
import '../../src/core/network/net_work_info.dart';
import 'data/datasources/agents_data_source.dart';
import 'data/repositories/agents_repository_impl.dart';
import 'domain/use_cases/agents_detail_usecase.dart';
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
  sl.registerLazySingleton(
    () => AgentsDetailsUseCase(aentsRepository: sl<AgentsRepositoryImpl>()),
  );
  sl.registerLazySingleton(
    () => AgentCubit(agentsUseCase: sl<AgentsUseCase>()),
  );
  sl.registerLazySingleton(
    () => DetailAgentsCubit(agentsUseCase: sl<AgentsDetailsUseCase>()),
  );
}
