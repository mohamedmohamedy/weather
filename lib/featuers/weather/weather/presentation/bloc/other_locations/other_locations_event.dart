part of 'other_locations_bloc.dart';

abstract class OtherLocationsEvent extends Equatable {
  const OtherLocationsEvent();

  @override
  List<Object> get props => [];
}

class AddNewLocationEvent extends OtherLocationsEvent {
  final String city;
  const AddNewLocationEvent(this.city);
  @override
  List<Object> get props => [city];
}

class GetAllSavedLocationsEvent extends OtherLocationsEvent {}

class DeleteLocationEvent extends OtherLocationsEvent {
  final String city;
  const DeleteLocationEvent(this.city);

   @override
  List<Object> get props => [city];
}
