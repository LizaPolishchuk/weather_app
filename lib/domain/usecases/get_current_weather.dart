import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/domain/entities/weather.dart';

class GetCurrentWeather {
  GetCurrentWeather({
    required WeatherRepository repository,
  }) : _repository = repository;

  final WeatherRepository _repository;

  Future<Weather> call({required String city}) async {
    return _repository.getCurrentWeather(city);
  }
}
