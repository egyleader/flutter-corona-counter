import 'package:corona/models/coronaData.dart';
import 'package:corona/models/country.dart';
import 'package:corona/services/prefrences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider extends ChangeNotifier {
  var _coronaData;
  get coronaData => _coronaData;

  Prefrences prefrencesInstance = Prefrences();


  Future<CoronaData> getData(
      {SharedPreferences preferences, String countryName}) async {
    // get saved Countries
    List<String> countriesNames = preferences.getStringList('countriesNames');
    print(countryName);
    print(countriesNames);
    // check if the country is cached

    if (countriesNames == null) {
      int index = Countries.countriesData()
          .indexWhere((country) => country.countryEn == countryName);
      String code = Countries.countriesData()[index].code;
      print(code);

      _coronaData = await getDataFromAPI(code);
      print(_coronaData);
      prefrencesInstance.updateCountryData(preferences, _coronaData);

      return _coronaData;
    }

    if (countriesNames.contains(countryName)) {
      // load country from cach if cached
      List<String> countriesStrings =
          preferences.getStringList('countriesData');
      print(countriesStrings);
      List<CoronaData> coronaList =
          prefrencesInstance.countriesStringToCoronaData(countriesStrings);

      _coronaData =
          prefrencesInstance.getCountryByName(countryName, coronaList);
      print('==============================================');
      print('loaded ${_coronaData.country} data from cache');
    } else {
      int index = Countries.countriesData()
          .indexWhere((country) => country.countryEn == countryName);
      String code = Countries.countriesData()[index].code;
      print(code);
      _coronaData = await getDataFromAPI(code);
    }
    return _coronaData;
  }

  Future<CoronaData> getDataFromAPI(String code) async {
    try {
      final response = await http.get(
          'https://covid-19-data.p.rapidapi.com/country/code?format=undefined&code=$code',
          headers: {
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key":
                "bb41ead216msh312599d519776eap1d913cjsna46ca0ea9471"
          });

      List<dynamic> data = json.decode(response.body);
      print(data[0]['country']);
      _coronaData = CoronaData(
          country: data[0]['country'],
          confirmed: data[0]['confirmed'],
          recovered: data[0]['recovered'],
          deaths: data[0]['deaths']);
      print('Corona Status for ${coronaData.country} is:');
      print(
          'confirmed : ${coronaData.confirmed} , recovered : ${coronaData.recovered} , deaths: ${coronaData.deaths}');
      notifyListeners();
    } catch (e) {
      print(e);
    }

    return _coronaData;
  }
}
