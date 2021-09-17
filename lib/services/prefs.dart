import 'package:corona/models/corona_data.dart';
import 'package:countries_utils/countries.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;
import 'package:flutter/material.dart';

class Prefs {
  static late SharedPreferences _prefsInstance;
  static SharedPreferences get instance => _prefsInstance; // shared prefrences singleton

  /// inits the [SharedPreferences] instance to use all over the app
  ///
  /// you have to call this early in the app ,, ideally on splash screen
  static Future<void> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
  }

  /// gets a [Color] from a [String] value stored in [SharedPreferences]
  static Color? getColor(String key) {
    var colorInt = _prefsInstance.getInt(key);
    return Color(colorInt ?? Colors.transparent.value);
  }

  /// converts a [Color] to a [String] that stored in [SharedPreferences]
  static Future<bool?> setColor(String key, Color color) async {
    return _prefsInstance.setInt(key, color.value);
  }

  /// gets a [DateTime] from a [String] value stored in [SharedPreferences]
  static DateTime? getDate(String key) {
    var date = _prefsInstance.getString(key);
    return DateTime.parse(date.toString());
  }

  /// converts  a [DateTime] to a [String] value that stored in [SharedPreferences]
  static Future<bool?> setDate(String key, DateTime date) async {
    return _prefsInstance.setString(key, date.toString());
  }
  /// converts a [CoronaData] to a [String] and storing it in [SharedPreferences]
  static Future<bool?> setCoronaData(CoronaData data) => _prefsInstance.setStringList(
      (data.country?.name).toString(), [data.confirmed.toString(), data.deaths.toString(), data.recovered.toString()]);

  /// gets [String] data for a [Country.name] and converting it to [CoronaData] 
  static CoronaData? getCoronaData(String countryName) {
    List<String>? countryStrings = _prefsInstance.getStringList(countryName);
    return countryStrings == null
        ? null
        : CoronaData(
            country: Countries.byName(countryName),
            confirmed: int.parse(countryStrings[0]),
            recovered: int.parse(countryStrings[1]),
            deaths: int.parse(countryStrings[2]));
  }
}
