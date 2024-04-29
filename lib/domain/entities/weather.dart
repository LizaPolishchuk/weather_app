import 'package:flutter/foundation.dart';
import 'package:weather_app/common/extensions/string_extensions.dart';

@immutable
class Weather {
  final double temperature;
  final WeatherCondition weatherCondition;
  final DateTime lastUpdated;

  const Weather({
    required this.temperature,
    required this.weatherCondition,
    required this.lastUpdated,
  });
}

enum WeatherCondition {
  sunny,
  cloudy,
  partlyCloudy,
  rainy,
  snowy;

  String get title => switch (this) {
        WeatherCondition.partlyCloudy => 'Partly Cloudy',
        _ => name.capitalize(),
      };

  String get iconPath => 'assets/${name.toLowerCase()}.svg';
}
