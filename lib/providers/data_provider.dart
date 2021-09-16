import 'package:connectivity/connectivity.dart';
import 'package:corona/models/corona_data.dart';
import 'package:corona/services/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  late CoronaData _coronaData;
  get coronaData => _coronaData;

  Future<void> init() async {
    String _code;
    if (Prefs.instance?.getString('lastCountry') == null ||
        Prefs.instance?.getString('lastCountry') == '') {
      _code = await FlutterSimCountryCode.simCountryCode.toString();
      Prefs.instance?.setString('lastCountry', _code);
    } else {
      _code = Prefs.instance?.getString('lastCountry') as String;
    }

    Prefs.instance?.setStringList('countriesData', []);
    Prefs.instance?.setStringList('countriesCodes', []);
    DataProvider dataProvider = DataProvider();
    _coronaData = await dataProvider.getData(countryCode: _code);
  }

  Future<CoronaData> getData({required String countryCode}) async {
    List<String>? countriesCodes =
        Prefs.instance?.getStringList('countriesCodes');

    // * if there is no cached data cereate it for this country

    if (countriesCodes == null || countriesCodes.isEmpty) {
      _coronaData = CoronaData.fromJson(await getDataFromAPI(countryCode));

      Prefs.updateCountryData(_coronaData, countryCode);
      notifyListeners();

      return _coronaData;
    }

    // * if there is maching data fetch it

    else if (countriesCodes.contains(countryCode)) {
      notifyListeners();

      return _coronaData;
    }

    // * data is not cached , get it from internet and cache it

    else {
      _coronaData = CoronaData.fromJson(await getDataFromAPI(countryCode));
      Prefs.updateCountryData(_coronaData, countryCode);
    }
    notifyListeners();

    return _coronaData;
  }

  Future<Map<String, dynamic>> getDataFromAPI(String code) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return {};
    }

    try {
      final response = await http.get(
          Uri(
              path:
                  'https://covid-19-data.p.rapidapi.com/country/code?code=$code'),
          headers: {
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key":
                "c75168236emsh249d0232e5ef7cap156f3ajsnaa5b9cbe891f",
          });
      return json.decode(response.body);
    } catch (e) {
      print(e);
      return {};
    }
  }
}
