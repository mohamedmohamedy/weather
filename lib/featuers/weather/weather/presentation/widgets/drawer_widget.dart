import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_strings.dart';
import '../../../../../core/constants/app_values.dart';
import '../pages/manage_locations.dart';
import '../../../../../core/constants/colors_constants.dart';

import 'favorite_city.dart';
import 'favorite_city_form.dart';
import 'other_locations.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsConstants.drawerColor,
      child: Padding(
        padding: const EdgeInsets.only(top: ConstantDoubles.d_120),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //______________________Favorite city section__________________________________
                  const Icon(
                    Icons.star_rounded,
                    size: ConstantDoubles.d_20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: ConstantDoubles.d_50),
                  Text(
                    DrawerStrings.favoriteLocation,
                    style: TextStyle(
                      fontSize: ConstantDoubles.d_15,
                      color: ColorsConstants.lightGreyColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: ConstantDoubles.d_20),
              const FavoriteCity(),
              const SizedBox(height: ConstantDoubles.d_20),
              FavoriteCityForm(),

              //______________________________________________________________________
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ConstantDoubles.d_20),
                child: Container(
                  color: ColorsConstants.whiteColor,
                  height: ConstantDoubles.d_3,
                  width: double.infinity,
                ),
              ),

              //___________________________________________________________________________
              const SizedBox(height: ConstantDoubles.d_20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: ConstantDoubles.d_8),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: ColorsConstants.whiteColor,
                        size: ConstantDoubles.d_30,
                      ),
                    ),
                  ),
                  Text(
                    DrawerStrings.otherLocations,
                    style: TextStyle(color: ColorsConstants.lightGreyColor),
                  ),
                ],
              ),
              const SizedBox(height: ConstantDoubles.d_15),
              const OtherLocations(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorsConstants.elevatedButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ConstantDoubles.d_12),
                    ),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(ManageLocations.routName),
                  child: const Text(DrawerStrings.elevatedButtonText)),
            ],
          ),
        ),
      ),
    );
  }
}
