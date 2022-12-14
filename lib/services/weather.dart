import 'dart:html';

import 'package:weather_app1/services/location.dart';
import 'package:weather_app1/services/networking.dart';
const apiKey = '5f7c435ad58034456116891cfef110eb';
class WeatherModel{
  Future<dynamic> getCityWeather(String cityName)async{
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    var mylocation=await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${mylocation.latitude}&lon=${mylocation.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  //34.025917
  //71.560135
  String? getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String? getWeatherMessage(int temperature) {
    if (temperature > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temperature > 20) {
      return 'Time for shorts and ๐';
    } else if (temperature < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}