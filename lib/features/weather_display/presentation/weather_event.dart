part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {

  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class LoadWeatherEvent extends WeatherEvent {
  final Position position;
  const LoadWeatherEvent(this.position);
    @override
  List<Object?> get props => [];
}