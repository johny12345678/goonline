
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:goonline_app/features/weather_display/domain/usecase/weather_usecase.dart';
import 'package:weather/weather.dart';
part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUsecase loadWeatherUsecase;
   WeatherBloc(this.loadWeatherUsecase) : super(const InitWeatherState()) {
    on<LoadWeatherEvent>(_loadData);
  }

  FutureOr<void> _loadData(LoadWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(const LoadingWeatherState());

    final result = await loadWeatherUsecase.call(event.position);
    result.fold(
      (left) => emit(FailureWeatherState(left.toString())),
     (right) => emit(LoadedWeatherState(right)));

  }
}
