import 'dart:convert';

class CoronaData {
  CoronaData(
      {this.country,
      this.code,
      this.lastChecked,
      this.confirmed,
      this.deaths,
      this.recovered});

  final String country;
  final String code;
  final String lastChecked;
  final int confirmed;
  final int deaths;
  final int recovered;

  static String coronaDataToString(CoronaData data) {
    Map<String, dynamic> coronaMap = {
      'country': data.country,
      'code': data.code,
      'confirmed': data.confirmed,
      'deaths': data.deaths,
      'recovered': data.recovered,
      'lastChecked':data.lastChecked.toString()
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
      String data = coronaDataToString(item);
      list.add(data);
    }

    return list;
  }
}
