import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../entities/full_weather.dart';

import '../repositories/weather_repo.dart';

class GetWeatherByCityUseCase {
  final WeatherRepository repository;
  GetWeatherByCityUseCase(this.repository);

  Future<Either<Failure, FullWeatherEntity>> call(String city) =>
      repository.getWeatherByCity(city);
}
