import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/common/extensions/dio_extensions.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/data/source/remote/api_client.dart';
import 'package:weather_app/domain/repository/weather_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  ///Data sources
  getIt.registerLazySingleton(() => APIClient(Dio()..addInterceptors()));

  ///Repository
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(apiClient: getIt()));
}
