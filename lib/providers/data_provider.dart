import 'package:connectivity/connectivity.dart';
import 'package:corona/models/corona_data.dart';
import 'package:corona/services/prefs.dart';
import 'package:countries_utils/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider extends ChangeNotifier {
  late CoronaData _coronaData; // corona data for the last selected country

  late List<String> _countriesAvailable; // list of all countries available from api

  get coronaData => _coronaData;

  get countriesAvailable => _countriesAvailable;

  /// inits the data on app launch ..
  ///
  /// it searches the [SharedPreferences] for 'lastCountry' and
  /// if it is found load the data for that country
  /// if not get the country from sim card location
  Future<void> init() async {
    String _countryName = Prefs.instance.getString('lastCountry') ?? '';
    _countriesAvailable = Prefs.instance.getStringList('countriesAvailable') ?? [];
    if (_countryName == '' || _countriesAvailable.isEmpty) {
      // get current country from sim and save it
      var _countryCode = (await FlutterSimCountryCode.simCountryCode).toString();
      _countryName = Countries.byCode(_countryCode).name.toString();
      Prefs.instance.setString('lastCountry', _countryName);

      // get available countries from api and save it
      Map<String, dynamic> _countriesMap = await getDataFromAPI('https://covid-193.p.rapidapi.com/countries');
      _countriesAvailable = _countriesMap['response'].cast<String>();
      Prefs.instance.setStringList('countriesAvailable', _countriesAvailable);
    }
    _coronaData = await getCountryCoronaData(_countryName);
    Prefs.setCoronaData(_coronaData);
  }

  /// gets [CoronaData] for a given [Country.name]
  ///
  /// it searches the [SharedPreferences] for saved data in the last day
  /// and load it if available , if not load it from api
  ///
  Future<CoronaData> getCountryCoronaData(String countryName) async {
    // * if there is no cached data get it from the api
    Map<String, dynamic> _coronaMapData = await getCountryDataFromAPI(countryName.toLowerCase());
    _coronaData = CoronaData.fromJson(_coronaMapData);
    notifyListeners();
    return _coronaData;
  }

  /// gets data from any given url of the api
  Future<Map<String, dynamic>> getDataFromAPI(String api) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return {};
    }
    try {
      final response = await http.get(Uri.parse(api), headers: {
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "c75168236emsh249d0232e5ef7cap156f3ajsnaa5b9cbe891f"
      });
      return json.decode(response.body);
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }

  Future<Map<String, dynamic>> getCountryDataFromAPI(String country) async =>
      getDataFromAPI('https://covid-193.p.rapidapi.com/statistics?country=$country');
}
