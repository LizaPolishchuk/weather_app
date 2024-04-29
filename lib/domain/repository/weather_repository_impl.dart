import 'package:weather_app/common/env/env.dart';
import 'package:weather_app/common/utils/weather_mapper.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/data/source/remote/api_client.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  @override
  Future<Weather> getCurrentWeather(String city) async {
    final response = await _apiClient.getCurrentWeather(city);
    return WeatherMapper.mapWeatherDtoToWeather(response.current);
  }
}
