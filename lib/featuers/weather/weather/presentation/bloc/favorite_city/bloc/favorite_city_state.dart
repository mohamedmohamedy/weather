part of 'favorite_city_bloc.dart';

abstract class FavoriteCityState extends Equatable {
  const FavoriteCityState();

  @override
  List<Object> get props => [];
}

class FavoriteCityInitial extends FavoriteCityState {}

class FavoriteCityLoadingState extends FavoriteCityState {}

class FavoriteCityFailingState extends FavoriteCityState {
  final String failMessage;
  const FavoriteCityFailingState({required this.failMessage});
  @override
  List<Object> get props => [failMessage];
}

class GettingFavoriteCitySuccessState extends FavoriteCityState {
  final FullWeatherEntity fullWeather;
  const GettingFavoriteCitySuccessState(this.fullWeather);
  @override
  List<Object> get props => [fullWeather];
}
