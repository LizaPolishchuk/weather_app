import 'package:dio/dio.dart';
import 'package:weather_app/common/env/env.dart';

extension DioExtension on Dio {
  addInterceptors() {
    interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters["key"] = Env.weatherApiKey;
          return handler.next(options);
        },
      ),
    ]);
  }
}
