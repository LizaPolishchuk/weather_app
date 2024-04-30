import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/domain/entities/weather_location.dart';

part 'weather_details_state.dart';

class WeatherDetailsCubit extends Cubit<WeatherDetailsState> {
  WeatherDetailsCubit({
    required WeatherRepository weatherRepository,
    required WeatherLocation weatherLocation,
  })  : _weatherRepository = weatherRepository,
        super(WeatherDetailsState(weatherLocation: weatherLocation));

  final WeatherRepository _weatherRepository;

  fetchCurrentWeather() {
    emit(state.copyWith(status: WeatherDetailsPageStatus.loading));

    _weatherRepository
        .getCurrentWeather(
      state.weatherLocation.city,
      state.weatherLocation.country,
    )
        .then((weather) {
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
}
