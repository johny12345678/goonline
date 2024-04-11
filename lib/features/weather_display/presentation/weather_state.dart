
part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object?> get props => [];
}


class InitWeatherState extends WeatherState {
  const InitWeatherState();
}


class LoadingWeatherState extends WeatherState {
  const LoadingWeatherState();

}
class LoadedWeatherState extends WeatherState {
  final Weather weather;
  const LoadedWeatherState(this.weather);

  @override
  List<Object> get props => [weather];
}
class FailureWeatherState extends WeatherState {
  final String errorMessage;
  const FailureWeatherState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}