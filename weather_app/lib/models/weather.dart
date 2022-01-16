import 'package:weather_app/models/networking.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric&lang=vi';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.GetCurrentLocation();

    var url =
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric&lang=vi';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧️';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Thích hợp để ăn 🍦 trong lúc này';
    } else if (temp > 20) {
      return 'Thời tiết mát mẻ ☘️';
    } else if (temp < 10) {
      return 'Bạn sẽ cần mang theo 🧣 và 🧤';
    } else {
      return 'Mang áo 🧥 vào lúc này';
    }
  }
}
