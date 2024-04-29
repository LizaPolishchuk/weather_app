import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/extensions/list_extensions.dart';
import 'package:weather_app/common/navigation/navigation_cubit.dart';
import 'package:weather_app/common/navigation/navigation_state.dart';
import 'package:weather_app/domain/entities/weather_location.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit({required NavigationCubit navigationCubit})
      : _routeCubit = navigationCubit,
        super(const LocationsState());

  final NavigationCubit _routeCubit;

  final List<WeatherLocation> _mockedLocations = const [
    WeatherLocation(city: 'London', country: 'UK'),
    WeatherLocation(city: 'New York', country: 'USA'),
    WeatherLocation(city: 'Paris', country: 'France'),
    WeatherLocation(city: 'Berlin', country: 'Germany'),
  ];

  fetchLocationsList() => emit(state.copyWith(locations: _mockedLocations));

  goToWeatherDetails(int index, WeatherLocation location) =>
      _routeCubit.emit(WeatherDetailsRouteState(index: index, location: location));

  updateLocationWeather(int index, WeatherLocation location) =>
      emit(state.copyWith(locations: state.locations.toList()..replaceItem(index, location)));
}
