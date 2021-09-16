import 'dart:convert';

import 'package:countries_utils/flutter_country.dart';

class CoronaData {
  CoronaData(
      {this.country,
      required this.code,
      this.lastChecked,
      this.confirmed,
      this.deaths,
      this.recovered});

  final Country? country;
  final String code;
  final String? lastChecked;
  final int? confirmed;
  final int? deaths;
  final int? recovered;

  factory CoronaData.fromJson(Map<String, dynamic> map) {
    Country country = Countries.byName(map['response'][0]['country']);

    return CoronaData(
        country: country,
        code: country.alpha2Code.toString(),
        confirmed: map['response'][0]['cases']['total'],
        recovered: map['response'][0]['cases']['recovered'],
        deaths: map['response'][0]['deaths']['total'],
        lastChecked: DateTime.now().toString());
  }

  static String coronaDataToJson(CoronaData data) {
    Map<String, dynamic> coronaMap = {
      'country': data.country,
      'code': data.code,
      'confirmed': data.confirmed,
      'deaths': data.deaths,
      'recovered': data.recovered,
      'lastChecked': data.lastChecked.toString()
    };

    return json.encode(coronaMap);
  }

  static List<CoronaData> stringsListToCoronaData(List<String> stringList) {
    List<CoronaData> list = [];
    for (var string in stringList) {
      CoronaData data = stringToCoronaData(string);
      list.add(data);
    }

    return list;
  }

  static CoronaData stringToCoronaData(String string) {
    Map<String, dynamic> decode = json.decode(string);

    return CoronaData(
        country: decode['country'],
        code: decode['code'],
        confirmed: decode['confirmed'],
        deaths: decode['deaths'],
        recovered: decode['recovered'],
        lastChecked: decode['lastChecked']);
  }

  static List<String> coronaDataListToString(
      List<CoronaData> countriesCoronaData) {
    List<String> list = [];
    for (CoronaData item in countriesCoronaData) {
      String data = coronaDataToJson(item);
      list.add(data);
    }

    return list;
  }
}
