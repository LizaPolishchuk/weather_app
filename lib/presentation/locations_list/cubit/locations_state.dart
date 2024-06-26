part of 'locations_cubit.dart';

class LocationsState extends Equatable {
  const LocationsState({this.locations = const []});

  final List<WeatherLocation> locations;

  LocationsState copyWith({
    List<WeatherLocation>? locations,
  }) {
    return LocationsState(
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object> get props => [locations];
}
