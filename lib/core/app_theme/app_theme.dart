import 'package:flutter/material.dart';

import '../constants/app_values.dart';
import '../constants/colors_constants.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    cardTheme: CardTheme(
      color: ColorsConstants.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ConstantDoubles.d_12)),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: Colors.white, fontSize: 15),
    ),
    iconTheme: IconThemeData(
      color: Colors.orange[300],
      size: 20,
    ),
  );
}
