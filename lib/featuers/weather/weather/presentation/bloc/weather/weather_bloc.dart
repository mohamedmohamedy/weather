import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/full_weather.dart';
import '../../../domain/usecases/get_favorite_city.dart';
import '../../../domain/usecases/get_full_weather.dart';
import '../../../domain/usecases/get_weather_by_city.dart';
import '../fail_message.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetFullWeatherUseCase getFullWeather;
  
final GetWeatherByCityUseCase getWeatherByCity;
  WeatherBloc(
    this.getFullWeather,  this.getWeatherByCity,
  ) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetFullWeatherEvent) {
        emit(LoadingState());
        final response = await getFullWeather();

        response.fold(
          (failure) => emit(FullWeatherLoadingFailState(
              failMessage: FailingMessage.getFailureMessage(failure))),
          (fullWeather) =>
              emit(FullWeatherLoadingSuccessState(fullWeather: fullWeather)),
        );
      }

     if (event is GetWeatherByCityEvent) {
        emit(LoadingState());

        final response = await getWeatherByCity(event.city);
        response.fold(
          (failure) => emit(FullWeatherLoadingFailState(
              failMessage: FailingMessage.getFailureMessage(failure))),
          (fullWeather) => emit(FullWeatherLoadingSuccessState(fullWeather:  fullWeather)),
        );
      }
      //___________________________________________________________
    });
  }

  //TODO: Reformate the code (_getState).

}
