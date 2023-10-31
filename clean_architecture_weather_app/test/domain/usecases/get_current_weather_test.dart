import 'package:clean_architecture_weather_app/domain/entities/weather_entity.dart';
import 'package:clean_architecture_weather_app/domain/usecases/get_current_weather.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase = GetCurrentWeatherUseCase(mockWeatherRepository);
  });

  const testWeatherDetail = WeatherEntity(
    sityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const testCityName = 'New York';

  test('should get current weather detail from the repository', () async {
    // arrange
    when(mockWeatherRepository.getCurrentWeather(testCityName))
        .thenAnswer((_) async => const Right(testWeatherDetail));

    // act
    final result = await getCurrentWeatherUseCase.execute(testCityName);

    // assert
    expect(result, const Right(testWeatherDetail));
  });
}
