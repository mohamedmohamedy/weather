import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';

import '../models/full_weather.dart';

const CACHED_DATA = 'CACHED_DATA';

abstract class WeatherLocalDataSource {
  Future<Unit> cacheWeather(FullWeatherModel fullWeather);
  Future<FullWeatherModel> getCachedWeather();
  Future<Unit> addNewLocation(FullWeatherModel fullWeather);
  Future<List<FullWeatherModel>> getAllSavedLocations();
  Future<Unit> deleteLocationFromCache(String city);
}

class WeatherLocalDataSourceImp implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;
  WeatherLocalDataSourceImp(this.sharedPreferences);

//_______________________________________________________________________
  @override
  Future<Unit> cacheWeather(FullWeatherModel fullWeather) async {
    final data = fullWeatherModelToJson(fullWeather);

    await sharedPreferences.setString(CACHED_DATA, data);

    return Future.value(unit);
  }

//________________________________________________________________________
  @override
  Future<FullWeatherModel> getCachedWeather() async {
    final cachedData = sharedPreferences.getString(CACHED_DATA);

    if (cachedData != null) {
      final weatherData = fullWeatherModelFromJson(cachedData);
      return Future.value(weatherData);
    } else {
      throw EmptyCacheException();
    }
  }

  //_____________________________________________________

  @override
  Future<Unit> addNewLocation(FullWeatherModel fullWeather) async {
    final oldData =  sharedPreferences.getStringList('Saved_Locations') ?? [];
    final List<String> dataList = [];
    final data = fullWeatherModelToJson(fullWeather);
    dataList.add(data);
    dataList.addAll(oldData);
    await sharedPreferences.setStringList('Saved_Locations', dataList);
    return Future.value(unit);
  }
  //_____________________________________________________

  @override
  Future<List<FullWeatherModel>> getAllSavedLocations() async {
    final List<String>? data =
        sharedPreferences.getStringList('Saved_Locations');
    if (data != null) {
      final List<FullWeatherModel> fullWeatherList =
          data.map((e) => fullWeatherModelFromJson(e)).toList();
      return Future.value(fullWeatherList);
    } else {
      throw EmptyCacheException();
    }
  }

//______________________________________________________________________________

  @override
  Future<Unit> deleteLocationFromCache(String city) async {
    List<String>? savedLocationsList =
        sharedPreferences.getStringList('Saved_Locations');
    if (savedLocationsList != null) {
      List<FullWeatherModel> savedLocationsListModel =
          savedLocationsList.map((e) => fullWeatherModelFromJson(e)).toList();
      savedLocationsListModel
          .removeWhere((element) => element.city.name == city);
      final data = savedLocationsListModel
          .map((e) => fullWeatherModelToJson(e))
          .toList();
      sharedPreferences.setStringList('Saved_Locations', data);
      return Future.value(unit);
    } else {
      throw EmptyCacheException();
    }
  }
}
