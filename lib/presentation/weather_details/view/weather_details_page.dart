import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/navigation/navigation_state.dart';
import 'package:weather_app/presentation/base/base_page.dart';
import 'package:weather_app/presentation/weather_details/cubit/weather_details_cubit.dart';
import 'package:weather_app/presentation/weather_details/view/components/weather_details_view.dart';

class WeatherDetailsPage extends BasePage {
  const WeatherDetailsPage({super.key});

  @override
  Widget get buildLayout => const WeatherDetailsView();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          context.read<WeatherDetailsCubit>().goBack();
        }
        return;
      },
      child: super.build(context),
    );
  }

  @override
  void onRoute(BuildContext context, NavigationState state) {
    super.onRoute(context, state);
  }
}
