import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/constants/app_strings.dart';
import 'package:weather_app/core/constants/app_values.dart';
import 'package:weather_app/featuers/weather/weather/presentation/pages/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: ConstantInt.i_10))
        .then((_) => Navigator.of(context).pushNamed(HomePage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(AssetImagesLink.splashAnimation1),
    );
  }
}
