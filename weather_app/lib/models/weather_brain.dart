import 'package:weather_app/models/networking.dart';
import 'package:weather_app/models/location.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        '${dotenv.env['openWeatherMapURL']}?q=$cityName&appid=${dotenv.env['apiKey']}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeatherForecast(String cityName) async {
    var url =
        '${dotenv.env['openWeatherMapForecastURL']}?q=$cityName&appid=${dotenv.env['apiKey']}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.GetCurrentLocation();
    var url =
        '${dotenv.env['openWeatherMapURL']}?lat=${location.latitude}&lon=${location.longtitude}&appid=${dotenv.env['apiKey']}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeatherForecast() async {
    Location location = Location();
    await location.GetCurrentLocation();

    var url =
        '${dotenv.env['openWeatherMapForecastURL']}?lat=${location.latitude}&lon=${location.longtitude}&appid=${dotenv.env['apiKey']}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
