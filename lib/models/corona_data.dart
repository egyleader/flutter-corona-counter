import 'dart:convert';

import 'package:countries_utils/flutter_country.dart';

class CoronaData {
  CoronaData(
      {required this.country,
      this.lastChecked,
      this.confirmed,
      this.deaths,
      this.recovered});

  final Country? country;
  final String? lastChecked;
  final int? confirmed;
  final int? deaths;
  final int? recovered;

  factory CoronaData.fromJson(Map<String, dynamic> map) {
    Country country = Countries.byName(map["response"][0]["country"]);

    return CoronaData(
        country: country,
        confirmed: map["response"][0]["cases"]["total"],
        recovered: map['response'][0]['cases']['recovered'],
        deaths: map['response'][0]['deaths']['total'],
        lastChecked: DateTime.now().toString());
  }

  factory CoronaData.fromMap(Map<String,dynamic> map)=>
     CoronaData(
        country: map['country'],
        confirmed: map['confirmed'],
        deaths: map['deaths'],
        recovered: map['recovered'],
        lastChecked: map['lastChecked']);

  static String toJson(CoronaData data) {
    Map<String, dynamic> coronaMap = {
      'country': data.country,



      'confirmed': data.confirmed,
      'deaths': data.deaths,
      'recovered': data.recovered,
      'lastChecked': data.lastChecked.toString()
    };

    return json.encode(coronaMap);
  }

}
