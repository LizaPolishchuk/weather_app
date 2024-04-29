import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/weather_details/cubit/weather_details_cubit.dart';

class WeatherDetailsView extends StatelessWidget {
  const WeatherDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: BlocBuilder<WeatherDetailsCubit, WeatherDetailsState>(
        bloc: context.read<WeatherDetailsCubit>()..fetchCurrentWeather(),
        builder: (context, state) {
          return switch (state.status) {
            WeatherDetailsPageStatus.loading => const Center(child: CircularProgressIndicator()),
            WeatherDetailsPageStatus.success => Column(
                children: [
                  Text(state.weatherLocation.city),
                  Text(state.weatherLocation.country),
                  Text(state.weatherLocation.weather!.temperature.toString()),
                ],
              ),
            WeatherDetailsPageStatus.failure => const Center(child: Text('Failed to fetch weather')),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
