import 'package:dartz/dartz.dart';
import '../repositories/weather_repo.dart';

import '../../../../../core/errors/failures.dart';

class DeleteLocationUSeCase {
  final WeatherRepository repository;
  DeleteLocationUSeCase(this.repository);

  Future<Either<Failure, Unit>> call(String city) async =>
      repository.deleteLocation(city);
}
