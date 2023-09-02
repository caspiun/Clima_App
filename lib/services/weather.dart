import 'package:clima/screens/loading_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const   apikey= 'd6844ab700382a731241be620079bd6f';
const openweathermapurl='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getlocationweather()async
  {
    await location.getLocationLocation();

    latitude=(location.Latitude);
    longitude=(location.Longitude);
    String apiUrl='$openweathermapurl?lat=$latitude&lon=$longitude&appid=$apikey&units=metric';
    Uri uri = Uri.parse(apiUrl);
    NetworkHelper networkhelper =NetworkHelper(uri);
    var weatherdata=await networkhelper.getdata();
    return weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
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
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}