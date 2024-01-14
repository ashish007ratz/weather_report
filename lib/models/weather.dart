import 'package:weather/weather.dart';

class WeatherRepo {
  static Future<Weather> fetchWeatherByCity(String cityName) async {
    String key = '73c277c3dc70d919d627d04a9ef30dd8'; // api key to validate with server
    WeatherFactory wf = new WeatherFactory(key); //create an instance
    Weather w = await wf.currentWeatherByCityName(cityName); // get data from server with all the required parameters
    return w;
  }
}



