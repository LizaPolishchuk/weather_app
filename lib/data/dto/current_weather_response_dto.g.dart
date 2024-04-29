// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherResponseDto _$CurrentWeatherResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherResponseDto(
      current: WeatherDto.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherResponseDtoToJson(
        CurrentWeatherResponseDto instance) =>
    <String, dynamic>{
      'current': instance.current,
    };
