import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../entities/full_weather.dart';
import '../repositories/weather_repo.dart';

class GetSavedLocations {
  final WeatherRepository repository;
  GetSavedLocations(this.repository);

  Future<Either<Failure, List<FullWeatherEntity>>> call() async =>
      repository.getSavedLocations();
}
