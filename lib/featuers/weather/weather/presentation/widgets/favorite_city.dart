import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/colors_constants.dart';
import '../bloc/favorite_city/bloc/favorite_city_bloc.dart';

class FavoriteCity extends StatelessWidget {
  const FavoriteCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCityBloc, FavoriteCityState>(
      builder: (context, state) {
        if (state is GettingFavoriteCitySuccessState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.fullWeather.city.name,
                style: TextStyle(
                  fontSize: 20,
                  color: ColorsConstants.whiteColor,
                ),
              ),
              const SizedBox(width: 40),
              const Icon(Icons.sunny),
              const SizedBox(width: 5),
              Text(
                '${state.fullWeather.list[0].main.tempMax.toStringAsFixed(0)}\u00b0 ',
                style: TextStyle(
                  color: ColorsConstants.whiteColor,
                ),
              ),
            ],
          );
        } else if (state is FavoriteCityFailingState) {
          return Text(state.failMessage);
        }
        return Container();
      },
    );
  }
}





















// class FavoriteCity extends StatefulWidget {
//   const FavoriteCity({Key? key}) : super(key: key);

//   @override
//   State<FavoriteCity> createState() => _FavoriteCityState();
// }

// class _FavoriteCityState extends State<FavoriteCity> {
//   bool isInit = true;
//   FullWeatherModel? weather;
//   @override
//   void didChangeDependencies() async {
//     if (isInit == true) {
//       final shared = await SharedPreferences.getInstance();

//       final decodedData = shared.getString('CACHED_DATA');
//       if (decodedData != null) {
//         final FullWeatherModel data = fullWeatherModelFromJson(decodedData);
//         setState(() {
//           weather = data;
//         });
//         isInit = false;
//       }
//     }
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           weather?.city.name ?? '',
//           style: TextStyle(
//             fontSize: 20,
//             color: ColorsConstants.whiteColor,
//           ),
//         ),
//         const SizedBox(width: 40),
//         const Icon(Icons.sunny),
//         const SizedBox(width: 5),
//         Text(
//           '${weather!.list[0].main.tempMax.toStringAsFixed(0)}\u00b0 ',
//           style: TextStyle(
//             color: ColorsConstants.whiteColor,
//           ),
//         ),
//       ],
//     );
//   }
// }
