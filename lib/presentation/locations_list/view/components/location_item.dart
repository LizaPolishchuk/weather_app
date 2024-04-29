import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/weather_location.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    required this.weatherLocation,
    required this.onTap,
    super.key
  });

  final WeatherLocation weatherLocation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(weatherLocation.city),
        subtitle: Text(weatherLocation.country),
        trailing: Text('${weatherLocation.weather?.temperature}°C'),
        onTap: onTap,
      ),
    );
  }
}
