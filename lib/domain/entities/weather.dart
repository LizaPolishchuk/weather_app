import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/common/extensions/string_extensions.dart';

@immutable
class Weather extends Equatable {
  final int temperature;
  final WeatherCondition weatherCondition;
  final DateTime lastUpdated;

  const Weather({
    required this.temperature,
    required this.weatherCondition,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [temperature, weatherCondition, lastUpdated];
}

enum WeatherCondition {
  sunny('sunny'),
  cloudy('cloudy'),
  partlyCloudy('partly_cloudy'),
  rainy('rainy');

  const WeatherCondition(this.value);

  final String value;

  String get title => switch (this) { WeatherCondition.partlyCloudy => 'Partly Cloudy', _ => name.capitalize() };

  String get iconPath => 'assets/icons/ic_$value.svg';
}
