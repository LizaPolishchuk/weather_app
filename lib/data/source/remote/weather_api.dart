import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app/data/dto/current_weather_response_dto.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: "http://api.weatherapi.com/v1/")
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET("current.json")
  @FormUrlEncoded()
  Future<CurrentWeatherResponseDto> getCurrentWeather(@Query("q") String query);
}

