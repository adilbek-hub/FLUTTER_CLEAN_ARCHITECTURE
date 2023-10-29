import 'package:clean_architecture_weather_app/core/error/failure.dart';
import 'package:clean_architecture_weather_app/domain/entities/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String sityName);
}
