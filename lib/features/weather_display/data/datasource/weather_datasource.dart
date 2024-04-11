import 'package:goonline_app/utils/utils.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

abstract class WeatherDatasource {
  Future<Weather> loadWeather(Position position);
}

class WeatherDatasourceImpl extends WeatherDatasource {
  @override
  Future<Weather> loadWeather(Position position) async {
    try {
      WeatherFactory factory =
          WeatherFactory(apiKeyWeather, language: Language.ENGLISH);
      Weather weather = await factory.currentWeatherByLocation(
          position.latitude, position.longitude);
      return weather;
    } catch (e) {
      throw Exception(e);
    }
  }
}
