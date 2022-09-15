import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/network_info.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import '../models/full_weather.dart';
import '../../domain/entities/full_weather.dart';
import '../../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo deviceStatus;
  final WeatherLocalDataSource localDataSource;

  WeatherRepoImpl(
      this.remoteDataSource, this.deviceStatus, this.localDataSource);

//______________________________________________________________________
  @override
  Future<Either<Failure, FullWeatherEntity>> getFullWeather() async {
    if (await deviceStatus.isConnected) {
      try {
        final fullWeather = await remoteDataSource.getFullWeather();
        return Right(fullWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  //___________________________________________________________________________

  @override
  Future<Either<Failure, FullWeatherEntity>> getWeatherByCity(
      String city) async {
    if (await deviceStatus.isConnected) {
      try {
        final weatherData = await remoteDataSource.getWeatherByCity(city);
        await localDataSource.cacheWeather(weatherData);
        return Right(weatherData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final weatherData = await localDataSource.getCachedWeather();
        return Right(weatherData);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  //______________________________________________________

  @override
  Future<Either<Failure, FullWeatherEntity>> getFavoriteCity() async {
    try {
      final weatherData = await localDataSource.getCachedWeather();
      return Right(weatherData);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }

  //____________________________________________________________________
  @override
  Future<Either<Failure, Unit>> addNewLocation(String city) async {
    if (await deviceStatus.isConnected) {
      try {
        final FullWeatherModel fullWeather =
            await remoteDataSource.getWeatherByCity(city);
        await localDataSource.addNewLocation(fullWeather);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  //__________________________________________________________
  @override
  Future<Either<Failure, List<FullWeatherEntity>>> getSavedLocations() async {
    try {
      final List<FullWeatherModel> data =
          await localDataSource.getAllSavedLocations();
      return Right(data);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }

  //_______________________________________________________________________
  @override
  Future<Either<Failure, Unit>> deleteLocation(String city) async {
    try {
      await localDataSource.deleteLocationFromCache(city);
      return const Right(unit);
    } on EmptyCacheException {
      return left(EmptyCacheFailure());
    }
  }
}
