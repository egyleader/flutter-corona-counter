import 'package:countries_utils/flutter_country.dart';

class CoronaData {
  CoronaData({required this.country, this.lastChecked, this.confirmed, this.deaths, this.recovered});

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
}
