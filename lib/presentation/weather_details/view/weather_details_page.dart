import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/common/utils/app_colors.dart';
import 'package:weather_app/domain/entities/weather_location.dart';
import 'package:weather_app/presentation/weather_details/cubit/weather_details_cubit.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if(didPop) return;
        Navigator.of(context).pop(context.read<WeatherDetailsCubit>().state.weatherLocation);
        return;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocBuilder<WeatherDetailsCubit, WeatherDetailsState>(
          bloc: context.read<WeatherDetailsCubit>()..fetchCurrentWeather(),
          builder: (context, state) {
            return switch (state.status) {
              WeatherDetailsPageStatus.loading => const Center(child: CircularProgressIndicator()),
              WeatherDetailsPageStatus.success => _buildWeatherDetails(state.weatherLocation),
              WeatherDetailsPageStatus.failure => const Center(child: Text('Failed to fetch weather')),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }

  Widget _buildWeatherDetails(WeatherLocation weatherLocation) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherLocation.city,
            style: const TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
          ),
          Text(
            weatherLocation.country,
            style: const TextStyle(fontSize: 28),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: SvgPicture.asset(
              weatherLocation.weather!.weatherCondition.iconPath,
              height: 250,
            ),
          ),
          Text(
            '${weatherLocation.weather!.temperature} °C',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
          ),
          Text(
            weatherLocation.weather!.weatherCondition.title,
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
