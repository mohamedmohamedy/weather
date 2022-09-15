part of 'other_locations_bloc.dart';

abstract class OtherLocationsState extends Equatable {
  const OtherLocationsState();
  
  @override
  List<Object> get props => [];
}

class OtherLocationsInitial extends OtherLocationsState {}
class LocationsLoadingState extends OtherLocationsState {}


class SuccessToAddNewLocationState extends OtherLocationsState {}

class SuccessToGetSavedLocationsState extends OtherLocationsState {
  final List<FullWeatherEntity> weatherList;
  const SuccessToGetSavedLocationsState(this.weatherList);
  @override
  List<Object> get props => [weatherList];
}

class FailingState extends OtherLocationsState {
  final String failMessage;
  const FailingState({required this.failMessage});
  @override
  List<Object> get props => [failMessage];
}

class DeletingLocationSuccessState extends OtherLocationsState{}