import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import '../../domain/entities/full_weather.dart';
import '../../../../../core/extensions/hours_extension.dart';
import 'package:flutter/material.dart';

import '../bloc/weather/weather_bloc.dart';

class TempChart extends StatefulWidget {
  final FullWeatherLoadingSuccessState state;
  const TempChart({Key? key, required this.state}) : super(key: key);

  @override
  State<TempChart> createState() => _TempChartState();
}

class _TempChartState extends State<TempChart> {
  @override
  Widget build(BuildContext context) {
    final weatherList = widget.state.fullWeather.list;
    final List<FListElementEntity> chartList = [];

    chartList.add(weatherList.first);
    for (FListElementEntity i in weatherList) {
      if (chartList.last.dtTxt.day != i.dtTxt.day) {
        chartList.add(i);
      }
    }
    // log(chartList.);
    chartList.forEach((element) {
      log(element.main.temp.toString());
      log(element.dtTxt.day.toString());
    });
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        swapAnimationCurve: Curves.bounceIn,
        swapAnimationDuration: const Duration(milliseconds: 150),
        LineChartData(
          backgroundColor: Colors.white,
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              dotData: FlDotData(show: true),
              spots: chartList
                  .map((e) => FlSpot(e.dtTxt.day.toDouble(), e.main.temp))
                  .toList(),
            ),
          ],
          // borderData: FlBorderData(
          //     border: const Border(bottom: BorderSide(), left: BorderSide())),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
      // ),
    );
  }
}
