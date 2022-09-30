import 'package:valo/container_injector.dart';
import 'package:valo/features/agents/presentation/cubit/agent_cubit.dart';
import 'package:valo/features/map/presentation/cubit/maps_cubit.dart';

import '../../src/core/api/dio_helper.dart';
import '../../src/core/network/net_work_info.dart';
import 'data/data_sources/map_data_source.dart';
import 'data/repositories/map_respository.dart';
import 'domain/use_cases/map_usecase.dart';


void initMapJector() {
  sl.registerLazySingleton<MapsDataSourceImpl>(
        () => MapsDataSourceImpl(dioHelper: sl<DioHelper>()),
  );
  sl.registerLazySingleton(
        () => MapsRepositoryImpl(
      networkInfo: sl<NetworkInfoImpl>(),
      mapDataSource: sl<MapsDataSourceImpl>(),
    ),
  );
  sl.registerLazySingleton(
        () => MapUseCase(mapRepository: sl<MapsRepositoryImpl>()),
  );
  sl.registerLazySingleton(
        () => MapsCubit(mapUseCase: sl<MapUseCase>()),
  );
}
