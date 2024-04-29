import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '../weather_app/secret.env')
abstract class Env {
  @EnviedField(varName: 'WEATHER_API_KEY')
  static const  String weatherApiKey =  _Env.weatherApiKey;
}