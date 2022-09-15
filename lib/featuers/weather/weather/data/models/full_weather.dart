// To parse this JSON data, do
//
//     final fullWeatherModel = fullWeatherModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:weather_app/featuers/weather/weather/domain/entities/full_weather.dart';

FullWeatherModel fullWeatherModelFromJson(String str) =>
    FullWeatherModel.fromJson(json.decode(str));

String fullWeatherModelToJson(FullWeatherModel data) =>
    json.encode(data.toJson());

class FullWeatherModel extends FullWeatherEntity {
  const FullWeatherModel({
    required super.cod,
    required super.message,
    required super.cnt,
    required super.list,
    required super.city,
  });

  factory FullWeatherModel.fromJson(Map<String, dynamic> json) =>
      FullWeatherModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<FListElementModel>.from(
            json["list"].map((x) => FListElementModel.fromJson(x))),
        city: FCityModel.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => FListElementModel(
                dt: x.dt,
                main: x.main,
                weather: x.weather,
                clouds: x.clouds,
                wind: x.wind,
                visibility: x.visibility,
                // pop: x.pop,
                sys: x.sys,
                dtTxt: x.dtTxt)
            .toJson())),
        "city": FCityModel(
                id: city.id,
                name: city.name,
                coord: city.coord,
                country: city.country,
                population: city.population,
                timezone: city.timezone,
                sunrise: city.sunrise,
                sunset: city.sunset)
            .toJson(),
      };
}

class FCityModel extends FCityEntity {
  const FCityModel({
    required super.id,
    required super.name,
    required super.coord,
    required super.country,
    required super.population,
    required super.timezone,
    required super.sunrise,
    required super.sunset,
  });

  factory FCityModel.fromJson(Map<String, dynamic> json) => FCityModel(
        id: json["id"],
        name: json["name"],
        coord: FCoordModel.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": FCoordModel(lat: coord.lat, lon: coord.lon).toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class FCoordModel extends FCoordEntity {
  const FCoordModel({
    required super.lat,
    required super.lon,
  });
  factory FCoordModel.fromJson(Map<String, dynamic> json) => FCoordModel(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class FListElementModel extends FListElementEntity {
  const FListElementModel({
    required super.dt,
    required super.main,
    required super.weather,
    required super.clouds,
    required super.wind,
    required super.visibility,
    // required super.pop,
    required super.sys,
    required super.dtTxt,
  });

  factory FListElementModel.fromJson(Map<String, dynamic> json) =>
      FListElementModel(
        dt: json["dt"],
        main: FMainClassModel.fromJson(json["main"]),
        weather: List<FWeatherModel>.from(
            json["weather"].map((x) => FWeatherModel.fromJson(x))),
        clouds: FCloudsModel.fromJson(json["clouds"]),
        wind: FWindModel.fromJson(json["wind"]),
        visibility: json["visibility"],
        // pop: int.parse(json["pop"])  ,
        sys: FSysModel.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main,
        "weather": List<dynamic>.from(weather.map((x) => FWeatherModel(
                id: x.id,
                main: x.main,
                description: x.description,
                icon: x.icon)
            .toJson())),
        "clouds": FCloudsModel(all: clouds.all).toJson(),
        "wind": FWindModel(speed: wind.speed, deg: wind.deg, gust: wind.gust)
            .toJson(),
        "visibility": visibility,
        // "pop": pop,
        "sys": FSysModel(pod: sys.pod).toJson(),
        "dt_txt": dtTxt.toIso8601String(),
      };
}

class FCloudsModel extends FCloudsEntity {
  const FCloudsModel({
    required super.all,
  });

  factory FCloudsModel.fromJson(Map<String, dynamic> json) => FCloudsModel(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class FMainClassModel extends FMainClassEntity {
  const FMainClassModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.seaLevel,
    required super.grndLevel,
    required super.humidity,
    required super.tempKf,
  });

  factory FMainClassModel.fromJson(Map<String, dynamic> json) =>
      FMainClassModel(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class FSysModel extends FSysEntity {
  const FSysModel({
    required super.pod,
  });

  factory FSysModel.fromJson(Map<String, dynamic> json) => FSysModel(
        pod: json["pod"],
      );

  Map<String, dynamic> toJson() => {
        "pod": pod,
      };
}

// enum Pod { D, N }

// final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class FWeatherModel extends FWeatherEntity {
  const FWeatherModel({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory FWeatherModel.fromJson(Map<String, dynamic> json) => FWeatherModel(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

// enum Description { CLEAR_SKY, FEW_CLOUDS }

// final descriptionValues = EnumValues(
//     {"clear sky": Description.CLEAR_SKY, "few clouds": Description.FEW_CLOUDS});

// enum Icon { THE_01_D, THE_01_N, THE_02_D }

// final iconValues = EnumValues(
//     {"01d": Icon.THE_01_D, "01n": Icon.THE_01_N, "02d": Icon.THE_02_D});

// enum MainEnum { CLEAR, CLOUDS }

// final mainEnumValues =
//     EnumValues({"Clear": MainEnum.CLEAR, "Clouds": MainEnum.CLOUDS});

class FWindModel extends FWindEntity {
  FWindModel({
    required super.speed,
    required super.deg,
    required super.gust,
  });

  factory FWindModel.fromJson(Map<String, dynamic> json) => FWindModel(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
