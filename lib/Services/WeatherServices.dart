import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/Models/WeatherModels.dart';

class WeatherServices {
  final String apiKey = '6d93477b8ccb3b0b76dad7e4b53a9b1d';

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
    );

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}