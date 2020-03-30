import 'dart:convert';

class CoronaData {
  CoronaData({this.country, this.confirmed, this.deaths, this.recovered});

  final String country;

  final int confirmed;
  final int deaths;
  final int recovered;

  factory CoronaData.fromJson(Map<String, dynamic> json) {
    return CoronaData(
      country: json['country'] as String,
      confirmed: json['confirmed'] as int,
      deaths: json['deaths'] as int,
      recovered: json['recovered'] as int,
    );
  }

  static String coronaDataToString(CoronaData data) {
    Map<String, dynamic> coronaMap = {
      'country': data.country,
      'confirmed': data.confirmed,
      'deaths': data.deaths,
      'recovered': data.recovered
    };

    return json.encode(coronaMap);
  }

  static List<CoronaData> stringsListToCoronaData(List<String> stringList) {
    List<CoronaData> list = [];
    for (var string in stringList) {
      CoronaData data = stringToCoronaData(string);
      print('country: ${data.country} , confirmed: ${data.confirmed}');
      list.add(data);
    }

    return list;
  }

  static CoronaData stringToCoronaData(String string) {
    Map<String, dynamic> decode = json.decode(string);

    return CoronaData(
        country: decode['country'],
        confirmed: decode['confirmed'],
        deaths: decode['deaths'],
        recovered: decode['recovered']);
  }

  static List<String> coronaDataListToString(
      List<CoronaData> countriesCoronaData) {
    List<String> list = [];
    for (CoronaData item in countriesCoronaData) {
      String data = coronaDataToString(item);
      list.add(data);
    }

    return list;
  }
}
