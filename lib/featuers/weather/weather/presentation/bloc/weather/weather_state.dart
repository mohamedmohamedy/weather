part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class LoadingState extends WeatherState {}

class FullWeatherLoadingSuccessState extends WeatherState {
  final FullWeatherEntity fullWeather;
  const FullWeatherLoadingSuccessState({required this.fullWeather});
  @override
  List<Object> get props => [fullWeather];
}

class FullWeatherLoadingFailState extends WeatherState {
  final String failMessage;
  const FullWeatherLoadingFailState({required this.failMessage});
  @override
  List<Object> get props => [failMessage];
}
