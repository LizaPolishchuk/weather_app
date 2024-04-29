import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/navigation/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState());
}
