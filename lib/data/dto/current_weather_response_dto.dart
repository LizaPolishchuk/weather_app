import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/dto/weather_dto.dart';

part 'current_weather_response_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentWeatherResponseDto {
  const CurrentWeatherResponseDto({required this.current});

  final WeatherDto current;

  factory CurrentWeatherResponseDto.fromJson(Map<String, dynamic> json) => _$CurrentWeatherResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherResponseDtoToJson(this);
}
