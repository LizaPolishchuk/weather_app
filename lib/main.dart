import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/navigation/navigation_cubit.dart';
import 'package:weather_app/common/navigation/routes.dart';
import 'package:weather_app/common/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(
    BlocProvider<NavigationCubit>.value(
      value: NavigationCubit(),
      child: const MaterialApp(
        title: 'Weather App',
        onGenerateRoute: onGenerateRoute,
      ),
    ),
  );
}
