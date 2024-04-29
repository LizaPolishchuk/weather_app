import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/navigation/navigation_cubit.dart';
import 'package:weather_app/common/navigation/navigation_state.dart';

///I also always use BaseCubit, but for this app it is overhead

abstract class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @protected
  abstract final Widget buildLayout;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, NavigationState>(
      listener: onRoute,
      child: buildLayout,
    );
  }

  @protected
  @mustCallSuper
  void onRoute(BuildContext context, NavigationState state) {
    if (state is BackRouteState) {
      Navigator.of(context).pop(state.result);
    }
  }
}
