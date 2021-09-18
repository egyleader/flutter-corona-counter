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
  late CoronaData _coronaData;
  get coronaData => _coronaData;
  
  /// inits the data on app launch ..
  /// 
  /// it searches the [SharedPreferences] for 'lastCountry' and 
  /// if it is found load the data for that country 
  /// if not get the country from sim card location 
  Future<void> init() async {
    String _countryName = Prefs.instance.getString('lastCountry') ?? '';

    if (_countryName == '') {
      var _countryCode = (await FlutterSimCountryCode.simCountryCode).toString();
      _countryName = Countries.byCode(_countryCode).name.toString();
      Prefs.instance.setString('lastCountry', _countryName);
    }
    _coronaData = await getCoronaData(_countryName);
    Prefs.setCoronaData(_coronaData);
  }

  Future<CoronaData> getCoronaData(String countryName) async {
    // * if there is no cached data get it from the api
    Map<String, dynamic> _coronaMapData = await getDataFromAPI(countryName.toLowerCase());
    _coronaData = CoronaData.fromJson(_coronaMapData);
    notifyListeners();
    return _coronaData;
  }

  Future<Map<String, dynamic>> getDataFromAPI(String country) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return {};
    }
    try {
      final response = await http.get(Uri.parse('https://covid-193.p.rapidapi.com/statistics?country=$country'),
          headers: {
            "x-rapidapi-host": "covid-193.p.rapidapi.com",
            "x-rapidapi-key": "c75168236emsh249d0232e5ef7cap156f3ajsnaa5b9cbe891f"
          });
      return json.decode(response.body);
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
