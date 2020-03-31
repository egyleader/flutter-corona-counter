import 'package:corona/models/coronaData.dart';
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
      {SharedPreferences preferences, String countryCode}) async {
    List<String> countriesCodes = preferences.getStringList('countriesCodes');

    // * if there is no cached data cereate it for this country
      print(countriesCodes);

    if (countriesCodes == null || countriesCodes == []) {
      _coronaData = await getDataFromAPI(countryCode);

      prefrencesInstance.updateCountryData(
          preferences, _coronaData, countryCode);
 
      return _coronaData;
    }

    // * if there is maching data fetch it

    else if (countriesCodes.contains(countryCode)) {
      print('cached');

      List<String> countriesStrings =
          preferences.getStringList('countriesData');
      List<CoronaData> coronaList =
          prefrencesInstance.countriesStringToCoronaData(countriesStrings);

      _coronaData =
          prefrencesInstance.getCountryByCode(countryCode, coronaList);

      print('loaded country ${_coronaData.country} from the Cache  ');

      return _coronaData;
    }

    // * data is not cached , get it from internet and cache it

    else {
      _coronaData = await getDataFromAPI(countryCode);
      prefrencesInstance.updateCountryData(
          preferences, _coronaData, countryCode);
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
      _coronaData = CoronaData(
          country: data[0]['country'],
          code: code,
          confirmed: data[0]['confirmed'],
          recovered: data[0]['recovered'],
          deaths: data[0]['deaths'],
          lastChecked: DateTime.now().toString());
      print('loaded country ${_coronaData.country} from the internet ');
      notifyListeners();
    } catch (e) {
      print(e);
    }

    return _coronaData;
  }
}
