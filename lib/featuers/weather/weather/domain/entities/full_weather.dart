import 'package:equatable/equatable.dart';

class FullWeatherEntity extends Equatable {
  const FullWeatherEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  final String cod;
  final int message;
  final int cnt;
  final List<FListElementEntity> list;
  final FCityEntity city;

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        list,
        city,
      ];
}

class FCityEntity extends Equatable {
  const FCityEntity({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  final int id;
  final String name;
  final FCoordEntity coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
        sunrise,
        sunset,
      ];
}

class FCoordEntity extends Equatable {
  const FCoordEntity({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  @override
  List<Object?> get props => [
        lat,
        lon,
      ];
}

class FListElementEntity extends Equatable {
  const FListElementEntity({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    // required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  final int dt;
  final FMainClassEntity main;
  final List<FWeatherEntity> weather;
  final FCloudsEntity clouds;
  final FWindEntity wind;
  final int visibility;
  // final int pop;
  final FSysEntity sys;
  final DateTime dtTxt;

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        // pop,
        sys,
        dtTxt,
      ];
}

class FCloudsEntity extends Equatable {
  const FCloudsEntity({
    required this.all,
  });

  final int all;

  @override
  List<Object?> get props => [all];
}

class FMainClassEntity extends Equatable {
  const FMainClassEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        grndLevel,
        humidity,
        tempKf,
      ];
}

class FSysEntity extends Equatable {
  const FSysEntity({
    required this.pod,
  });

  final dynamic pod;

  @override
  List<Object?> get props => [pod];
}

class FWeatherEntity extends Equatable {
  const FWeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final dynamic main;
  final dynamic description;
  final dynamic icon;

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}

class FWindEntity extends Equatable {
  const FWindEntity({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final double speed;
  final int deg;
  final double gust;

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}
