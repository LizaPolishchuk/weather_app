import 'package:weather_app/common/utils/weather_mapper.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/data/source/remote/weather_api.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl({
    required WeatherApi apiClient,
  }) : _apiClient = apiClient;

  final WeatherApi _apiClient;

  ///I send also the country, because the city name can be the same in different countries
  @override
  Future<Weather> getCurrentWeather(String city, String country) async {
    final response = await _apiClient.getCurrentWeather('$city,$country');
    return WeatherMapper.mapWeatherDtoToWeather(response.current);
  }
}
