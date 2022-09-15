import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/constants/colors_constants.dart';
import 'home.dart';

import '../../data/models/full_weather.dart';
import '../bloc/other_locations/other_locations_bloc.dart';
import '../bloc/weather/weather_bloc.dart';

class ManageLocations extends StatefulWidget {
  static const String routName = '/manage_locations_page';
  const ManageLocations({Key? key}) : super(key: key);

  @override
  State<ManageLocations> createState() => _ManageLocationsState();
}

class _ManageLocationsState extends State<ManageLocations> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OtherLocationsBloc>(context)
        .add(GetAllSavedLocationsEvent());
    return Scaffold(
      backgroundColor: ColorsConstants.lightGreyColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add new location'),
              content: TextFormField(onFieldSubmitted: (value) {
                BlocProvider.of<OtherLocationsBloc>(context)
                    .add(AddNewLocationEvent(value));
                Navigator.of(context).pop();
              }),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('cancel')),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<OtherLocationsBloc, OtherLocationsState>(
        listener: (context, state) {
          if (state is SuccessToAddNewLocationState) {
            Navigator.of(context).pushNamed(ManageLocations.routName);
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                backgroundColor: ColorsConstants.greenColor,
                content: const Text('New location added successfully')),
            );
          } else if (state is DeletingLocationSuccessState){
             ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text(' location deleted successfully')),
                          );
          } else if (state is FailingState){
             ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              backgroundColor: ColorsConstants.redColor,
                                content:
                                    Text(state.failMessage)),
                                  
                          );
          }
        },
        builder: (context, state) {
          if (state is LocationsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FailingState) {
            return Center(
              child: Text(state.failMessage),
            );
          } else if (state is SuccessToGetSavedLocationsState) {
            return ListView.builder(
              itemCount: state.weatherList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  BlocProvider.of<WeatherBloc>(context).add(
                      GetWeatherByCityEvent(
                          state.weatherList[index].city.name));
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        state.weatherList[index].city.name,
                        style: const TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          BlocProvider.of<OtherLocationsBloc>(context).add(DeleteLocationEvent(state.weatherList[index].city.name));
                          Navigator.of(context)
                              .pushNamed(ManageLocations.routName);
                         
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
