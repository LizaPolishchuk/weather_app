import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/di/injection_container.dart';
import 'package:weather_app/common/navigation/navigation_cubit.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/domain/entities/weather_location.dart';
import 'package:weather_app/presentation/locations_list/cubit/locations_cubit.dart';
import 'package:weather_app/presentation/locations_list/view/locations_page.dart';
import 'package:weather_app/presentation/weather_details/cubit/weather_details_cubit.dart';
import 'package:weather_app/presentation/weather_details/view/weather_details_page.dart';

///I also often use libs for navigation, such as go_router or auto_route,
///but here are just two screens, so I use the default navigation

class Routes {
  static const locations = '/';
  static const weatherDetails = '/weather-details';
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  return switch (settings.name) {
    Routes.locations => MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: LocationsCubit(navigationCubit: context.read<NavigationCubit>()),
          child: const LocationsPage(),
        ),
      ),
    Routes.weatherDetails => MaterialPageRoute(builder: (context) {
        final weatherLocation = settings.arguments as WeatherLocation;
        return BlocProvider(
            create: (context) => WeatherDetailsCubit(
                  navigationCubit: context.read<NavigationCubit>(),
                  weatherRepository: getIt<WeatherRepository>(),
                  weatherLocation: weatherLocation,
                ),
            child: const WeatherDetailsPage());
      }),
    _ => null,
  };
}
