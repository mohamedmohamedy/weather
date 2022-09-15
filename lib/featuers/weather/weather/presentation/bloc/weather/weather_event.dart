part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentWeatherEvent extends WeatherEvent {}

class RefreshCurrentWeatherEvent extends WeatherEvent {}

class GetFullWeatherEvent extends WeatherEvent {}

class GetWeatherByCityEvent extends WeatherEvent {
  final String city;
  const GetWeatherByCityEvent(this.city);
  @override
  List<Object> get props => [city];
}