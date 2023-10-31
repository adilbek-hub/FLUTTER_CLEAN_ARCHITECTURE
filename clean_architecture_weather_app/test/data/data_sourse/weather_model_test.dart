import 'dart:convert';
import 'package:clean_architecture_weather_app/data/models/weather_model.dart';
import 'package:clean_architecture_weather_app/domain/entities/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helper/dammy_data/json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(
    sityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  test('Sould be a sublclass of weather entity', () async {
    //assert
    expect(testWeatherModel, isA<WeatherEntity>());
  });
  test(
    'Sould return a valid model from json',
    () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dammy_data/dummy_weather_response.json'),
      );

      //act
      final result = WeatherModel.fromJson(jsonMap);

      //assert
      expect(result, equals(testWeatherModel));
    },
  );
}
