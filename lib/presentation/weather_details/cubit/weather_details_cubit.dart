import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/navigation/navigation_cubit.dart';
import 'package:weather_app/common/navigation/navigation_state.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/domain/entities/weather_location.dart';

part 'weather_details_state.dart';

class WeatherDetailsCubit extends Cubit<WeatherDetailsState> {
  WeatherDetailsCubit({
    required NavigationCubit navigationCubit,
    required WeatherRepository weatherRepository,
    required WeatherLocation weatherLocation,
  })  : _routeCubit = navigationCubit,
        _weatherRepository = weatherRepository,
        super(WeatherDetailsState(weatherLocation: weatherLocation));

  final WeatherRepository _weatherRepository;
  final NavigationCubit _routeCubit;

  fetchCurrentWeather() {
    emit(state.copyWith(status: WeatherDetailsPageStatus.loading));

    _weatherRepository.getCurrentWeather(state.weatherLocation.city).then((weather) {
      emit(
        state.copyWith(
          status: WeatherDetailsPageStatus.success,
          weatherLocation: state.weatherLocation.copyWith(weather: weather),
        ),
      );
    }).catchError((error) {
      debugPrint('fetchCurrentWeather Error: $error');
      emit(state.copyWith(status: WeatherDetailsPageStatus.failure));
    });
  }

  goBack() => _routeCubit.emit(BackRouteState(state.weatherLocation));
}
