import 'package:corona/models/coronaData.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  var _coronaData;
  get coronaData => _coronaData;

  Future<CoronaData> getData(String code) async {
    final response = await http.get(
        'https://covid-19-data.p.rapidapi.com/country/code?format=undefined&code=$code',
        headers: {
          "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
          "x-rapidapi-key": "bb41ead216msh312599d519776eap1d913cjsna46ca0ea9471"
        });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(response.body);
      _coronaData = CoronaData(
          country: data[0]['country'],
          confirmed: data[0]['confirmed'],
          recovered: data[0]['recovered'],
          deaths: data[0]['deaths']);
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
}
