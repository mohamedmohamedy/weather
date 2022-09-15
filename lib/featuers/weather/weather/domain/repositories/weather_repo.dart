import 'package:dartz/dartz.dart';
import '../entities/full_weather.dart';

import '../../../../../core/errors/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, FullWeatherEntity>> getFullWeather();
  Future<Either<Failure, FullWeatherEntity>> getWeatherByCity(String city);
  Future<Either<Failure, FullWeatherEntity>> getFavoriteCity();
  Future<Either<Failure, Unit>> addNewLocation(String city);
  Future<Either<Failure, List<FullWeatherEntity>>> getSavedLocations();
  Future<Either<Failure, Unit>> deleteLocation(String city);
}
