import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherDto {
  const WeatherDto({
    required this.lastUpdatedEpoch,
    required this.tempC,
    required this.precipMm,
    required this.cloud,
  });

  final int lastUpdatedEpoch;
  final double tempC;
  final double precipMm;
  final int cloud;

  factory WeatherDto.fromJson(Map<String, dynamic> json) => _$WeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}
