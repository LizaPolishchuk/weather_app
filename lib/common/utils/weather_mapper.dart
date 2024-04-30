import 'package:weather_app/data/dto/weather_dto.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherMapper {
  static Weather mapWeatherDtoToWeather(WeatherDto weatherDto) {
    return Weather(
      temperature: weatherDto.tempC.toInt(),
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(weatherDto.lastUpdatedEpoch * 1000),
      weatherCondition: mapWeatherCondition(weatherDto.cloud, weatherDto.precipMm),
    );
  }

  static WeatherCondition mapWeatherCondition(int cloud, double precipitation) {
    if (precipitation > 0) {
      return WeatherCondition.rainy;
    } else if (cloud < 30) {
      return WeatherCondition.sunny;
    } else if (cloud > 70) {
      return WeatherCondition.cloudy;
    }
    return WeatherCondition.partlyCloudy;
  }
}
