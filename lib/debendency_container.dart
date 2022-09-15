import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'featuers/weather/weather/data/datasources/local_data_source.dart';
import 'featuers/weather/weather/data/datasources/remote_data_source.dart';
import 'featuers/weather/weather/data/repositories/weather_repo_impl.dart';
import 'featuers/weather/weather/domain/repositories/weather_repo.dart';
import 'featuers/weather/weather/domain/usecases/add_new_location.dart';
import 'featuers/weather/weather/domain/usecases/delete_location.dart';
import 'featuers/weather/weather/domain/usecases/get_favorite_city.dart';
import 'featuers/weather/weather/domain/usecases/get_full_weather.dart';
import 'featuers/weather/weather/domain/usecases/get_saved_locations.dart';
import 'featuers/weather/weather/domain/usecases/get_weather_by_city.dart';
import 'featuers/weather/weather/presentation/bloc/favorite_city/bloc/favorite_city_bloc.dart';
import 'featuers/weather/weather/presentation/bloc/other_locations/other_locations_bloc.dart';

import 'featuers/weather/weather/presentation/bloc/weather/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// current weather feature
  // bloc
  sl.registerFactory(() => WeatherBloc(sl(), sl()));
  sl.registerFactory(() => OtherLocationsBloc(sl(), sl(), sl()));
  sl.registerFactory(() => FavoriteCityBloc(sl(), sl()));

  // use cases
  sl.registerLazySingleton(() => GetFullWeatherUseCase(sl()));
  sl.registerLazySingleton(() => GetWeatherByCityUseCase(sl()));
  sl.registerLazySingleton(() => GetFavoriteCityUseCase(sl()));
  sl.registerLazySingleton(() => AddNewLocation(sl()));
  sl.registerLazySingleton(() => GetSavedLocations(sl()));
  sl.registerLazySingleton(() => DeleteLocationUSeCase(sl()));

  // repository
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepoImpl(sl(), sl(), sl()));

  // data sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(sl()));
  sl.registerLazySingleton<WeatherLocalDataSource>(
      () => WeatherLocalDataSourceImp(sl()));

  // services
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  // external
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
