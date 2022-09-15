import 'package:flutter/material.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_values.dart';
import '../../../../../core/constants/colors_constants.dart';
import '../bloc/weather/weather_bloc.dart';

class GeneralWeatherState extends StatelessWidget {
  final FullWeatherLoadingSuccessState state;

  const GeneralWeatherState({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherData = state.fullWeather.list.first;
    final weatherIcon = weatherData.weather.first.icon;
    return Padding(
      padding: const EdgeInsets.only(top: ConstantDoubles.d_10),
      child: Card(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // General weather state
              GeneralWeatherWidget(
                icon: Image.network(
                  'http://openweathermap.org/img/wn/$weatherIcon.png',
                ),
                name: GeneralWeatherStateStrings.sky,
                data: weatherData.weather.first.main,
              ),
              const WidgetsDivider(),

              // Wind speed
              GeneralWeatherWidget(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: ConstantDoubles.d_10),
                    child: Image.asset(
                      AssetImagesLink.wind,
                    ),
                  ),
                  name: GeneralWeatherStateStrings.wind,
                  data: weatherData.wind.speed.toStringAsFixed(0) +
                      GeneralWeatherStateStrings.windSpeed),

              const WidgetsDivider(),

              // Humidity
              GeneralWeatherWidget(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: ConstantDoubles.d_11),
                  child: Image.asset(
                    AssetImagesLink.humidity,
                    color: Colors.white,
                    height: ConstantDoubles.d_30,
                  ),
                ),
                name: GeneralWeatherStateStrings.humidity,
                data: weatherData.main.humidity.toString() +
                    DaysTempStrings.percent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//_________________________Helper widgets____________________________________________

class WidgetsDivider extends StatelessWidget {
  const WidgetsDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstantDoubles.d_70,
      width: ConstantDoubles.d_1,
      color: ColorsConstants.greyColor,
    );
  }
}

class GeneralWeatherWidget extends StatelessWidget {
  const GeneralWeatherWidget({
    Key? key,
    required this.icon,
    required this.name,
    required this.data,
  }) : super(key: key);

  final Widget icon;
  final String name;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstantDoubles.d_10),
      child: Column(
        children: [
          // Icon
          SizedBox(
            width: 70,
            height: 70,
            child: icon,
          ),

          // name
          Text(
            name,
            style: TextStyle(
              fontSize: ConstantDoubles.d_15,
              color: ColorsConstants.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Data
          Padding(
            padding: const EdgeInsets.symmetric(vertical: ConstantDoubles.d_5),
            child: Text(
              data,
              style: TextStyle(
                color: ColorsConstants.lightGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
