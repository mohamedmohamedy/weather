import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/delete_location.dart';

import '../../../domain/entities/full_weather.dart';
import '../../../domain/usecases/add_new_location.dart';
import '../../../domain/usecases/get_saved_locations.dart';
import '../fail_message.dart';

part 'other_locations_event.dart';
part 'other_locations_state.dart';

class OtherLocationsBloc
    extends Bloc<OtherLocationsEvent, OtherLocationsState> {
  final GetSavedLocations getSavedLocations;
  final AddNewLocation addNewLocation;
  final DeleteLocationUSeCase deleteLocation;

  OtherLocationsBloc(
      this.getSavedLocations, this.addNewLocation, this.deleteLocation)
      : super(OtherLocationsInitial()) {
    on<OtherLocationsEvent>((event, emit) async {
      if (event is AddNewLocationEvent) {
        emit(LocationsLoadingState());

        final response = await addNewLocation(event.city);

        response.fold(
          (failure) => emit(FailingState(
              failMessage: FailingMessage.getFailureMessage(failure))),
          (_) => emit(SuccessToAddNewLocationState()),
        );
      }
      //_______________________________________________________________
      if (event is GetAllSavedLocationsEvent) {
        emit(LocationsLoadingState());

        final response = await getSavedLocations();

        response.fold(
          (failure) => emit(FailingState(
              failMessage: FailingMessage.getFailureMessage(failure))),
          (weatherList) => emit(SuccessToGetSavedLocationsState(weatherList)),
        );
      }

      //___________________________________________________________________
      if (event is DeleteLocationEvent) {
        emit(LocationsLoadingState());

        final response = await deleteLocation(event.city);

        response.fold(
          (failure) => emit(FailingState(failMessage: FailingMessage.getFailureMessage(failure))),
          (_) => emit(DeletingLocationSuccessState()),
        );
      }
    });
  }
}
