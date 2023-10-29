import 'package:clean_architecture_weather_app/domain/usecases/get_current_weather.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  MockWeatherRepository mockWeatherRepository;

setUp((){
 mockWeatherRepository = MockWeatherRepository();
 getCurrentWeatherUseCase = GetCurrentWeatherUseCase(mockWeatherRepository);
})
}
