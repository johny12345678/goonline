import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:goonline_app/features/weather_display/data/repository/weather_repository.dart';
import 'package:weather/weather.dart';

class WeatherUsecase {
  final WeatherRepository repository;
  const WeatherUsecase({required this.repository});

  Future<Either<Exception, Weather>> call(Position position) async =>
  await repository.loadWeather(position);


}