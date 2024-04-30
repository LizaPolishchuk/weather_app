import 'package:weather_app/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeather(String city, String country);
}
