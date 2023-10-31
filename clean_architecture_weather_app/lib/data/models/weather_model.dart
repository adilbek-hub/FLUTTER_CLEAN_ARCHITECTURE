import 'package:clean_architecture_weather_app/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {required String sityName,
      required String main,
      required String description,
      required String iconCode,
      required double temperature,
      required int pressure,
      required int humidity})
      : super(
          sityName: sityName,
          main: main,
          description: description,
          iconCode: iconCode,
          temperature: temperature,
          humidity: humidity,
          pressure: pressure,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        sityName: json['name'],
        main: json['weather']['0']['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        temperature: json['main']['temp'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
      );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': temperature,
          'pressure': pressure,
          'humidity': humidity,
        },
        'name': sityName,
      };
}
