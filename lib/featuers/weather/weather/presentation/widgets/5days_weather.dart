import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_values.dart';
import '../../../../../core/constants/colors_constants.dart';

import '../../domain/entities/full_weather.dart';
import '../bloc/weather/weather_bloc.dart';

class FiveDaysForecast extends StatelessWidget {
   final FullWeatherLoadingSuccessState state;
  const FiveDaysForecast({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FListElementEntity> list = [];
    final apiList = state.fullWeather.list;

    // Filter Api response list to only five days list.
    list.add(apiList.first);
    for (FListElementEntity i in apiList) {
      if (list.last.dtTxt.day != i.dtTxt.day) {
        list.add(i);
      }
    }

    return Card(
      child: Container(
        height: ConstantDoubles.d_200,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: ConstantDoubles.d_15),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: ConstantDoubles.d_15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                // Day's temp
                Text(
                  list[index].dtTxt.weekday == DateTime.now().weekday
                      ? DaysTempStrings.today
                      : (DateFormat.EEEE().format(list[index].dtTxt)),
                  style: Theme.of(context).copyWith().textTheme.headline1,
                ),
                const Spacer(),

                //  Humidity
                Row(
                  children: [
                    Icon(
                      Icons.water_drop,
                      size: ConstantDoubles.d_10,
                      color: ColorsConstants.whiteColor,
                    ),
                    const SizedBox(width: ConstantDoubles.d_3),
                    Text(
                      list[index].main.humidity.toString() +
                          DaysTempStrings.percent,
                      style: const TextStyle(
                        fontSize: ConstantDoubles.d_12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                // Sun icon
                const Padding(
                  padding: EdgeInsets.only(left: ConstantDoubles.d_20),
                  child: Icon(
                    Icons.wb_sunny_rounded,
                  ),
                ),

                // Moon icon
                Padding(
                  padding: const EdgeInsets.only(left: ConstantDoubles.d_20),
                  child: Image.asset(
                    AssetImagesLink.crescent,
                    height: ConstantDoubles.d_20,
                  ),
                ),

                // Max temp
                Padding(
                  padding: const EdgeInsets.only(left: ConstantDoubles.d_20),
                  child: Text(
                    '${(list[index].main.tempMax + ConstantDoubles.d_10).toStringAsFixed(0)}\u00b0',
                    style: Theme.of(context).copyWith().textTheme.headline2,
                  ),
                ),

                // Min temp
                Padding(
                  padding: const EdgeInsets.only(left: ConstantDoubles.d_20),
                  child: Text(
                    '${list[index].main.tempMin.toStringAsFixed(0)}\u00b0',
                    style: Theme.of(context).copyWith().textTheme.headline2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
