import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/full_weather.dart';
import '../../../../domain/usecases/get_favorite_city.dart';
import '../../../../domain/usecases/get_weather_by_city.dart';
import '../../fail_message.dart';

part 'favorite_city_event.dart';
part 'favorite_city_state.dart';

class FavoriteCityBloc extends Bloc<FavoriteCityEvent, FavoriteCityState> {
  final GetWeatherByCityUseCase getWeatherByCity;
  final GetFavoriteCityUseCase favoriteCity;
  FavoriteCityBloc(this.getWeatherByCity, this.favoriteCity) : super(FavoriteCityInitial()) {
    on<FavoriteCityEvent>((event, emit) async{
 if (event is GetFavoriteCityWeatherEvent) {
        emit(FavoriteCityLoadingState());

        final response = await getWeatherByCity(event.city);
        response.fold(
          (failure) => emit(FavoriteCityFailingState(
              failMessage: FailingMessage.getFailureMessage(failure))),
          (fullWeather) =>
              emit(GettingFavoriteCitySuccessState(fullWeather)),
        );
      }

      if (event is GetFavoriteCityEvent) {
        emit(FavoriteCityLoadingState());

        final response = await favoriteCity();
        response.fold(
          (failure) => emit(FavoriteCityFailingState(
              failMessage: FailingMessage.getFailureMessage(failure))),
          (fullWeather) => emit(GettingFavoriteCitySuccessState(fullWeather)),
        );
      }

    });
  }
}
