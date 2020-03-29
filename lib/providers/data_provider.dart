import 'package:corona/models/coronaData.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  var _coronaData;
   get coronaData => _coronaData;

  Future<CoronaData> getData(String country) async {
    if (country == "Palestin") country = "Israel";

    final response = await http.get(
        'https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=$country',
        headers: {
          'x-rapidapi-host': 'covid-19-coronavirus-statistics.p.rapidapi.com',
          'x-rapidapi-key':
              'bb41ead216msh312599d519776eap1d913cjsna46ca0ea9471',
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
       _coronaData = CoronaData(
          country: data['data']['covid19Stats'][0]['country'],
          confirmed: data['data']['covid19Stats'][0]['confirmed'],
          recovered: data['data']['covid19Stats'][0]['recovered'],
          deaths: data['data']['covid19Stats'][0]['deaths']);
      print('Corona Status for ${coronaData.country} is:');
      print(
          'confirmed : ${coronaData.confirmed} , recovered : ${coronaData.recovered} , deaths: ${coronaData.deaths}');
      notifyListeners();
      return coronaData;
    } else {
      print(response.statusCode);
      // throw Exception('Failed to load Data ');
    }
  }

  Future parseData(Map<String, dynamic> rawdata) {}
}
