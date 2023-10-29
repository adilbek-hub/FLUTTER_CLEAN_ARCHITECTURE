import 'package:clean_architecture_weather_app/domain/repositories/weather_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [WeatherRepository],
  customMocks: [MockSpec<http.Client>(as: #MoskHttpClient)],
)
void main() {}
