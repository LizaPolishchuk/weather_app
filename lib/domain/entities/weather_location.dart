import 'package:flutter/foundation.dart';
import 'package:weather_app/domain/entities/weather.dart';

@immutable
class WeatherLocation {
  final String city;
  final String country;
  final Weather? weather;

  const WeatherLocation({
    required this.city,
    required this.country,
    this.weather,
  });

  WeatherLocation copyWith({
    String? city,
    String? country,
    Weather? weather,
  }) {
    return WeatherLocation(
      city: city ?? this.city,
      country: country ?? this.country,
      weather: weather ?? this.weather,
    );
  }
}
