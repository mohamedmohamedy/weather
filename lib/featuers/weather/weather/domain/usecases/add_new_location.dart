import 'package:dartz/dartz.dart';
import '../repositories/weather_repo.dart';

import '../../../../../core/errors/failures.dart';

class AddNewLocation {
  final WeatherRepository repository;
  AddNewLocation(this.repository);

  Future<Either<Failure, Unit>> call(String city) async =>
      repository.addNewLocation(city);
}
