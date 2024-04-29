import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/navigation/navigation_state.dart';
import 'package:weather_app/common/navigation/routes.dart';
import 'package:weather_app/domain/entities/weather_location.dart';
import 'package:weather_app/presentation/base/base_page.dart';
import 'package:weather_app/presentation/locations_list/cubit/locations_cubit.dart';
import 'package:weather_app/presentation/locations_list/view/components/locations_list_view.dart';

class LocationsPage<WeatherDetailsCubit> extends BasePage {
  const LocationsPage({super.key});

  @override
  Widget get buildLayout => const LocationsListView();

  @override
  void onRoute(BuildContext context, NavigationState state) {
    if (state is WeatherDetailsRouteState) {
      Navigator.of(context)
          .pushNamed(Routes.weatherDetails, arguments: state.location)
          .then((value) => context.read<LocationsCubit>().updateLocationWeather(state.index, value as WeatherLocation));
    } else if (state is BackRouteState) {
      return;
    } else {
      super.onRoute(context, state);
    }
  }
}
