import 'package:clean_architecture_weather_app/core/error/failure.dart';
import 'package:clean_architecture_weather_app/domain/entities/weather_entity.dart';
import 'package:clean_architecture_weather_app/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentWeatherUseCase {
  GetCurrentWeatherUseCase(this.weatherRepository);
  final WeatherRepository weatherRepository;

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
