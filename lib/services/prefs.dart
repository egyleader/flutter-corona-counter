import 'package:corona/models/corona_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;
import 'package:flutter/material.dart';

class Prefs {
  static SharedPreferences? _prefsInstance;
  static SharedPreferences? get instance =>
      _prefsInstance; // shared prefrences singleton

  // call this method early in the app .. ideally on splash screen
  static Future<void> init() async {
    _prefsInstance = await instance;
    // any other specific logic for initalizing goes here
  }

  static Color? getColor(String key) {
    var colorInt = _prefsInstance?.getInt(key);
    return Color(colorInt ?? Colors.transparent.value);
  }

  static Future<bool?> setColor(String key, Color color) async {
    return _prefsInstance?.setInt(key, color.value);
  }

  static Future<bool?> setDate(String key, DateTime date) async {
    return _prefsInstance?.setString(key, date.toString());
  }

  static DateTime? getDate(String key) {
    var date = _prefsInstance?.getString(key);
    return DateTime.parse(date.toString());
  }

  static saveData(
      {required List<String> countriesData,
      required List<String> countriesNames}) {
    try {
      _prefsInstance?.setStringList('countriesData', countriesData);
      _prefsInstance?.setStringList('countriesCodes', countriesNames);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static List<CoronaData> countriesStringToCoronaData(
      List<String> _countriesDataStrings) {
    List<CoronaData> coronaData = [];

    for (String country in _countriesDataStrings) {
      CoronaData countryObject = CoronaData.stringToCoronaData(country);

      coronaData.add(countryObject);
    }

    return coronaData;
  }

  static void saveCountries(
      List<CoronaData> coronaData, SharedPreferences preferences) async {
    List<String> newCountriesData = [];

    for (var dataItem in coronaData) {
      String dataString = CoronaData.coronaDataToJson(dataItem);
      newCountriesData.add(dataString);
    }

    await preferences.setStringList('countriesData', newCountriesData);
  }

  static Future<bool> updateCountryData(
      CoronaData countryData, String name) async {
    List<String>? countriesStrings =
        _prefsInstance?.getStringList('countriesData');

    List<String>? countriesNames =
        _prefsInstance?.getStringList('countriesNames');

    if (countriesNames == []) {
      saveData(
          countriesData: [CoronaData.coronaDataToJson(countryData)],
          countriesNames: [name]);
      return true;
    }

    List<CoronaData> countriesCoronaData =
        CoronaData.stringsListToCoronaData(countriesStrings ?? []);
    for (CoronaData listItem in countriesCoronaData) {
      if (listItem.code == countryData.code) {
        listItem = countryData;
      }
    }

    if (countriesNames != null && countriesNames.contains(countryData.code)) {
      countriesCoronaData.add(countryData);
      countriesNames.add(countryData.code);
    }

    countriesStrings = CoronaData.coronaDataListToString(countriesCoronaData);

    saveData(
        countriesData: countriesStrings, countriesNames: countriesNames ?? []);
    return true;
  }

  static CoronaData getCountryByCode(
      String _code, List<CoronaData> _countriesCoronaData) {
    CoronaData country =
        _countriesCoronaData.singleWhere((country) => country.code == _code);
    return country;
  }
}
