import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../entities/full_weather.dart';
import '../repositories/weather_repo.dart';

class GetFullWeatherUseCase {
  final WeatherRepository repository;
  GetFullWeatherUseCase(this.repository);

  Future<Either<Failure, FullWeatherEntity>> call() async =>
      repository.getFullWeather();
}
