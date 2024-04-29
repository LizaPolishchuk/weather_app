import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/locations_list/cubit/locations_cubit.dart';
import 'package:weather_app/presentation/locations_list/view/components/location_item.dart';

class LocationsListView extends StatelessWidget {
  const LocationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: BlocBuilder<LocationsCubit, LocationsState>(
        bloc: context.read<LocationsCubit>()..fetchLocationsList(),
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.locations.length,
            itemBuilder: (context, index) {
              final location = state.locations[index];
              return LocationItem(
                weatherLocation: location,
                onTap: () => context.read<LocationsCubit>().goToWeatherDetails(index, location),
              );
            },
          );
        },
      ),
    );
  }
}
