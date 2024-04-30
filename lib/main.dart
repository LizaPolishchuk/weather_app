import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/extensions/dio_extensions.dart';
import 'package:weather_app/common/navigation/routes.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/data/source/remote/weather_api.dart';
import 'package:weather_app/domain/repository/weather_repository_impl.dart';
import 'package:weather_app/presentation/locations_list/cubit/locations_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    RepositoryProvider<WeatherRepository>.value(
      value: WeatherRepositoryImpl(apiClient: WeatherApi(Dio()..addInterceptors())),
      child: BlocProvider<LocationsCubit>.value(
        value: LocationsCubit(),
        child: const MaterialApp(
          title: 'Weather App',
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    ),
  );
}
