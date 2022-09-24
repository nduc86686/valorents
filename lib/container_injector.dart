import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:valo/src/core/api/dio_helper.dart';
import 'package:valo/src/core/api/interceptors.dart';
import 'package:valo/src/core/network/net_work_info.dart';


final sl = GetIt.instance;

void initApp() {
  initCore();

}

void initCore() {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());

  sl.registerLazySingleton<LogInterceptor>(
        () => LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  sl.registerLazySingleton<DioHelper>(() => DioHelper(dio: sl<Dio>()));
  sl.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker(),
  );
  sl.registerLazySingleton<NetworkInfoImpl>(
        () => NetworkInfoImpl(connectionChecker: sl<InternetConnectionChecker>()),
  );
}