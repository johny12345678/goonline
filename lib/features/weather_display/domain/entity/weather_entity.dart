import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

class WeatherEntity extends Equatable{
  final String city;
  final String temp;

 const WeatherEntity({required this.city, required this.temp});
 
  @override
  
  List<Object?> get props => [city, temp];

 



}