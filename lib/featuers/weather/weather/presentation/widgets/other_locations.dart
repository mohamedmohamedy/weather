import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_values.dart';
import '../../../../../core/constants/colors_constants.dart';
import '../bloc/other_locations/other_locations_bloc.dart';
import '../bloc/weather/weather_bloc.dart';
import '../pages/home.dart';

class OtherLocations extends StatelessWidget {
  const OtherLocations({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherLocationsBloc, OtherLocationsState>(
      builder: (context, state) {
        if (state is SuccessToGetSavedLocationsState) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.weatherList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                BlocProvider.of<WeatherBloc>(context).add(
                    GetWeatherByCityEvent(state.weatherList[index].city.name));
                Navigator.of(context).pushNamed(HomePage.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 57, bottom: ConstantDoubles.d_10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      size: ConstantDoubles.d_20,
                    ),
                    const SizedBox(width: ConstantDoubles.d_10),
                    Text(
                      state.weatherList[index].city.name,
                      style: TextStyle(color: ColorsConstants.whiteColor),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}







// class OtherLocations extends StatefulWidget {
//   const OtherLocations({Key? key}) : super(key: key);

//   @override
//   State<OtherLocations> createState() => _OtherLocationsState();
// }

// class _OtherLocationsState extends State<OtherLocations> {
//   bool _isInit = true;

//   @override
//   void didChangeDependencies() async {
//     if (_isInit == true) {
//       BlocProvider.of<WeatherBloc>(context).add(GetAllSavedLocationsEvent());
//       _isInit = false;
//     }
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WeatherBloc, WeatherState>(
//       builder: (context, state) {
//         if (state is SuccessToGetSavedLocationsState) {
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: state.weatherList.length,
//             itemBuilder: (context, index) => GestureDetector(
//               onTap: () {
//                 BlocProvider.of<WeatherBloc>(context).add(
//                     GetWeatherByCityEvent(state.weatherList[index].city.name));
//                 Navigator.of(context).pushNamed(HomePage.routeName);
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     left: 57, bottom: ConstantDoubles.d_10),
//                 child: Row(
//                   children: [
//                     const Icon(
//                       Icons.location_pin,
//                       size: ConstantDoubles.d_20,
//                     ),
//                     const SizedBox(width: ConstantDoubles.d_10),
//                     Text(
//                       state.weatherList[index].city.name,
//                       style: TextStyle(color: ColorsConstants.whiteColor),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//         return Container();
//       },
//     );
//   }
// }
