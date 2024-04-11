
import 'package:goonline_app/features/weather_display/domain/entity/weather_entity.dart';

class WeatherModel extends WeatherEntity{


 const WeatherModel({required super.city, required super.temp});
 
  @override
  
  List<Object?> get props => [city, temp];

 



}