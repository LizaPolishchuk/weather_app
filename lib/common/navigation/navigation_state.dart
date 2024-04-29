import 'package:flutter/foundation.dart';
import 'package:weather_app/domain/entities/weather_location.dart';

@immutable
class NavigationState {}

class BackRouteState<T> extends NavigationState {
  BackRouteState(this.result);

  final T result;
}

class WeatherDetailsRouteState extends NavigationState {
  WeatherDetailsRouteState({required this.index, required this.location});

  final int index;
  final WeatherLocation location;
}