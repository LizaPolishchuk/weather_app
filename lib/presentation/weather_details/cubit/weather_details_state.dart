part of 'weather_details_cubit.dart';

enum WeatherDetailsPageStatus { initial, loading, success, failure }

class WeatherDetailsState extends Equatable {
  const WeatherDetailsState({
    required this.weatherLocation,
    this.status = WeatherDetailsPageStatus.initial,
  });

  final WeatherLocation weatherLocation;
  final WeatherDetailsPageStatus status;

  WeatherDetailsState copyWith({
    WeatherLocation? weatherLocation,
    WeatherDetailsPageStatus? status,
  }) {
    return WeatherDetailsState(
      weatherLocation: weatherLocation ?? this.weatherLocation,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [weatherLocation, status];
}
