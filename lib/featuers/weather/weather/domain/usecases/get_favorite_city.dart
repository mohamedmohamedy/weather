import 'package:dartz/dartz.dart';
import '../repositories/weather_repo.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/full_weather.dart';

class GetFavoriteCityUseCase {
  final WeatherRepository repository;
  GetFavoriteCityUseCase(this.repository);

  Future<Either<Failure, FullWeatherEntity>> call() async=>
      repository.getFavoriteCity();
}
