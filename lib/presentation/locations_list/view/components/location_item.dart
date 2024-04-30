import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/common/utils/date_util.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/entities/weather_location.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({required this.weatherLocation, required this.onTap, super.key});

  final WeatherLocation weatherLocation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0x50D0BCFF),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildLocationDetails(weatherLocation),
            ),
            if (weatherLocation.weather != null) _buildWeatherDetails(weatherLocation.weather!),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationDetails(WeatherLocation location) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          location.city,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          location.country,
          style: const TextStyle(color: Colors.black87, fontSize: 14),
        ),
        const SizedBox(height: 20),
        Text(
          'Last updated: ${DateUtil.formatDate(location.weather?.lastUpdated)}',
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildWeatherDetails(Weather weather) {
    return Column(
      children: [
        SvgPicture.asset(weather.weatherCondition.iconPath, height: 48, width: 48),
        // const Spacer(),
        Text(
          '${weather.temperature}°C',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
