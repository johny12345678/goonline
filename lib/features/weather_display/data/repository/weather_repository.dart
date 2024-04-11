import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:goonline_app/features/weather_display/data/datasource/weather_datasource.dart';
import 'package:weather/weather.dart';

abstract class WeatherRepository {
  Future<Either<Exception, Weather>> loadWeather(Position position);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatasource datasource;
  WeatherRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, Weather>> loadWeather(Position position) async {
    try {
      final result = await datasource.loadWeather(position);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
