part of 'favorite_city_bloc.dart';

abstract class FavoriteCityEvent extends Equatable {
  const FavoriteCityEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteCityEvent extends FavoriteCityEvent{}

class GetFavoriteCityWeatherEvent extends FavoriteCityEvent {
  final String city;
  const GetFavoriteCityWeatherEvent(this.city);
  @override
  List<Object> get props => [city];
}
