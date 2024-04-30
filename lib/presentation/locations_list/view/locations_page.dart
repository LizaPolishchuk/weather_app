import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/navigation/routes.dart';
import 'package:weather_app/common/utils/app_colors.dart';
import 'package:weather_app/domain/entities/weather_location.dart';
import 'package:weather_app/presentation/locations_list/cubit/locations_cubit.dart';
import 'package:weather_app/presentation/locations_list/view/components/location_item.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locationsCubit = context.read<LocationsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: BlocBuilder<LocationsCubit, LocationsState>(
          bloc: locationsCubit..fetchLocationsList(),
          builder: (context, state) {
            return ListView.separated(
              itemCount: state.locations.length,
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final location = state.locations[index];
                return LocationItem(
                    weatherLocation: location,
                    onTap: () async {
                      final updatedLocation =
                          await Navigator.of(context).pushNamed(Routes.weatherDetails, arguments: location);
                      locationsCubit.updateLocationWeather(index, updatedLocation as WeatherLocation);
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
