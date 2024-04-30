import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/extensions/list_extensions.dart';
import 'package:weather_app/domain/entities/weather_location.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(const LocationsState());

  final List<WeatherLocation> _mockedLocations = const [
    WeatherLocation(city: 'Gdansk', country: 'Poland'),
    WeatherLocation(city: 'Stockholm', country: 'Sweden'),
    WeatherLocation(city: 'Sydney', country: 'Australia'),
    WeatherLocation(city: 'Christchurch', country: 'New Zealand'),
    WeatherLocation(city: 'Porto', country: 'Portugal'),
    WeatherLocation(city: 'Valencia', country: 'Spain'),
    WeatherLocation(city: 'Rijeka', country: 'Croatia'),
    WeatherLocation(city: 'Antalya', country: 'Turkey'),
  ];

  fetchLocationsList() => emit(state.copyWith(locations: _mockedLocations));

  updateLocationWeather(WeatherLocation location) {
    final index = state.locations.indexWhere((element) => element.city == location.city);
    emit(state.copyWith(locations: state.locations.toList()..replaceItem(index, location)));
  }
}
