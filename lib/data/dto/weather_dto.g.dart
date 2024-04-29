// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      lastUpdatedEpoch: (json['last_updated_epoch'] as num).toInt(),
      tempC: (json['temp_c'] as num).toDouble(),
      precipMm: (json['precip_mm'] as num).toDouble(),
      cloud: (json['cloud'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'temp_c': instance.tempC,
      'precip_mm': instance.precipMm,
      'cloud': instance.cloud,
    };
