import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app/common/env/env.dart';
import 'package:weather_app/data/dto/current_weather_response_dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://api.weatherapi.com/v1/")
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  @GET("current.json")
  @FormUrlEncoded()
  Future<CurrentWeatherResponseDto> getCurrentWeather(@Query("q") String city);
}

