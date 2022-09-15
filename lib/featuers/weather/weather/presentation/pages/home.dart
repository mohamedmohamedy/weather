import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/colors_constants.dart';
import '../bloc/weather/weather_bloc.dart';
import '../widgets/5days_weather.dart';
import '../widgets/current_weather_container.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/general_weather_state.dart';
import '../widgets/sun_state.dart';
import '../widgets/temp_chart.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ColorsConstants.dayMainColor,
                  ColorsConstants.daySecondaryColor,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<WeatherBloc, WeatherState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FullWeatherLoadingSuccessState) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CurrentWeatherContainer(state: state),
                          // TempChart(state: state),
                          FiveDaysForecast(state: state),
                          SunState(state: state),
                          GeneralWeatherState(state: state),
                        ],
                      ),
                    );
                  } else if (state is FullWeatherLoadingFailState) {
                    return Center(
                      child: Text(state.failMessage),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
        ));
  }
}
