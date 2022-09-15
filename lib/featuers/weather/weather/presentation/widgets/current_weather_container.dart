import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/constants/app_values.dart';
import '../../../../../core/constants/colors_constants.dart';
import '../../../../../core/constants/urls.dart';

import '../bloc/weather/weather_bloc.dart';

class CurrentWeatherContainer extends StatelessWidget {
   const CurrentWeatherContainer({
    Key? key,
    required this.state,
  }) : super(key: key);
   final FullWeatherLoadingSuccessState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: ConstantDoubles.d_100, left: ConstantDoubles.d_20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current temp.
              Text(
                ' ${state.fullWeather.list[0].main.temp.toStringAsFixed(0)}\u00b0 ',
                style: TextStyle(
                    color: ColorsConstants.whiteColor,
                    fontSize: ConstantDoubles.d_30),
              ),

              // City name
              Row(
                children: [
                  Text(
                    state.fullWeather.city.name,
                    style: TextStyle(
                        color: ColorsConstants.whiteColor,
                        fontSize: ConstantDoubles.d_30),
                  ),
                  Icon(
                    Icons.location_on,
                    color: ColorsConstants.whiteColor,
                    size: ConstantDoubles.d_18,
                  ),
                ],
              ),
              const SizedBox(
                height: ConstantDoubles.d_40,
              ),

              // Min & max temp for current time
              Text(
                '${state.fullWeather.list[0].main.tempMax.toStringAsFixed(0)}\u00b0 /${state.fullWeather.list[0].main.tempMin.toStringAsFixed(0)}\u00b0 Feels like ${state.fullWeather.list[0].main.feelsLike.toStringAsFixed(0)}\u00b0',
                style: TextStyle(
                    color: ColorsConstants.whiteColor,
                    fontWeight: FontWeight.bold),
              ),

              // Date time
              Padding(
                padding: const EdgeInsets.only(top: ConstantDoubles.d_8),
                child: Text(
                  '${DateFormat.E().format(DateTime.now())}, ${DateFormat.jm().format(DateTime.now())}',
                  style: TextStyle(
                    color: ColorsConstants.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Animation image
        Positioned(
          left: ConstantDoubles.d_200,
          top: ConstantDoubles.d_70,
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: ConstantDoubles.d_150,
              height: ConstantDoubles.d_150,
              child: Lottie.network(ConstantUrls.sunAnimationUrl,
                  fit: BoxFit.fill),
            ),
          ),
        )
      ],
    );
  }
}
