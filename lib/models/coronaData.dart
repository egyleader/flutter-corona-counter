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
      deaths: json['deaths'] as int ,
      recovered: json['recovered'] as int ,
    );
  }
}
