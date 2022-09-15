import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/app_strings.dart';
import '../bloc/favorite_city/bloc/favorite_city_bloc.dart';
import '../bloc/weather/weather_bloc.dart';

import '../../../../../core/constants/app_values.dart';
import '../../../../../core/constants/colors_constants.dart';

class FavoriteCityForm extends StatelessWidget {
  FavoriteCityForm({
    Key? key,
  }) : super(key: key);

  final TextEditingController favoriteLocationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ConstantDoubles.d_200,
      child: TextFormField(
        controller: favoriteLocationController,
        decoration: InputDecoration(
          hintText: DrawerStrings.favoriteLocationHint,
          hintStyle: TextStyle(color: ColorsConstants.daySecondaryColor),
        ),
        onFieldSubmitted: (value) {
          BlocProvider.of<FavoriteCityBloc>(context)
              .add(GetFavoriteCityWeatherEvent(value));
          favoriteLocationController.clear();
          BlocProvider.of<WeatherBloc>(context)
              .add(GetWeatherByCityEvent(value));
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
