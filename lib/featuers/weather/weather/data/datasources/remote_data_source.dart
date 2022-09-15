import 'package:http/http.dart' as http;
import '../models/full_weather.dart';

import '../../../../../core/errors/exceptions.dart';

const BASE_URL = 'https://api.openweathermap.org/data/2.5/forecast?q=';
const END_POINTS = '&units=metric&appid=d1aa58313f58aa9537e9aba1429fabf5';

const FULL_WEATHER_URL =
    'https://api.openweathermap.org/data/2.5/forecast?q=cairo&units=metric&appid=d1aa58313f58aa9537e9aba1429fabf5';

abstract class RemoteDataSource {
  Future<FullWeatherModel> getFullWeather();
  Future<FullWeatherModel> getWeatherByCity(String city);
}

class RemoteDataSourceImp implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImp(this.client);

  //______________________________________________________________________
  @override
  Future<FullWeatherModel> getFullWeather() async {
    final response = await client.get(Uri.parse(FULL_WEATHER_URL),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final fullWeatherModel = fullWeatherModelFromJson(response.body);
      return fullWeatherModel;
    } else {
      throw ServerException();
    }
  }

  //______________________________________________________________________
  @override
  Future<FullWeatherModel> getWeatherByCity(String city) async {
    final response = await client.get(Uri.parse(BASE_URL + city + END_POINTS),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final fullWeatherModel = fullWeatherModelFromJson(response.body);
      return fullWeatherModel;
    } else {
      throw ServerException();
    }
  }
}
