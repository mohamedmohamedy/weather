import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_values.dart';
import '../../../../../core/constants/colors_constants.dart';

import '../bloc/weather/weather_bloc.dart';

class SunState extends StatelessWidget {
 final FullWeatherLoadingSuccessState state;

   const SunState({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sunset = getSunTime(state.fullWeather.city.sunset);
    final sunrise = getSunTime(state.fullWeather.city.sunrise);

    return Padding(
      padding: const EdgeInsets.only(top: ConstantDoubles.d_10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(ConstantDoubles.d_10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SunStateWidget(
                  sunState: sunrise,
                  sunStateText: SunStateStrings.sunrise,
                  iconAsset: AssetImagesLink.sunrise,
                  iconColor: ColorsConstants.sunriseIcon!),
              SunStateWidget(
                  sunState: sunset,
                  sunStateText: SunStateStrings.sunset,
                  iconAsset: AssetImagesLink.sunset,
                  iconColor: ColorsConstants.sunsetIcon!)
            ],
          ),
        ),
      ),
    );
  }

  String getSunTime(int sunState) {
    final codedSunTime = DateTime.fromMillisecondsSinceEpoch(
      sunState * ConstantInt.i_1000,
    );

    final sunTime = DateFormat.jm().format(codedSunTime);
    return sunTime;
  }
}

class SunStateWidget extends StatelessWidget {
  const SunStateWidget({
    Key? key,
    required this.sunState,
    required this.sunStateText,
    required this.iconAsset,
    required this.iconColor,
  }) : super(key: key);

  final String sunStateText;
  final String sunState;
  final String iconAsset;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          sunStateText,
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          sunState,
          style: Theme.of(context).textTheme.headline2,
        ),
        Image.asset(
          iconAsset,
          color: iconColor,
        ),
      ],
    );
  }
}
