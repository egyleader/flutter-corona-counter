import 'package:corona/models/corona_data.dart';
import 'package:countries_utils/countries.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;
import 'package:flutter/material.dart';

/// make a wrapper around [SharedPreferences] to pe used all over the app
///
/// with helper functions to write and retrive certain types of data
class Prefs {
  static late SharedPreferences _instance;
  static SharedPreferences get instance => _instance; // shared prefrences singleton

  /// inits the [SharedPreferences] instance to use all over the app
  ///
  /// you have to call this early in the app ,, ideally on splash screen
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  /// gets a [Color] from a [String] value stored in [SharedPreferences]
  static Color? getColor(String key) {
    var colorInt = _instance.getInt(key);
    return Color(colorInt ?? Colors.transparent.value);
  }

  /// converts a [Color] to a [String] that stored in [SharedPreferences]
  static Future<bool?> setColor(String key, Color color) async {
    return _instance.setInt(key, color.value);
  }

  /// gets a [DateTime] from a [String] value stored in [SharedPreferences]
  static DateTime? getDate(String key) {
    var date = _instance.getString(key);
    return DateTime.parse(date.toString());
  }

  /// converts  a [DateTime] to a [String] value that stored in [SharedPreferences]
  static Future<bool?> setDate(String key, DateTime date) async {
    return _instance.setString(key, date.toString());
  }

  /// converts a [CoronaData] to a [String] and storing it in [SharedPreferences]
  static Future<bool?> setCoronaData(CoronaData data) => _instance.setStringList(
      (data.country?.name).toString(), [data.confirmed.toString(), data.deaths.toString(), data.recovered.toString()]);

  /// gets [String] data for a [Country.name] and converting it to [CoronaData]
  static CoronaData? getCountryCoronaData(String countryName) {
    List<String>? countryStrings = _instance.getStringList(countryName);
    return countryStrings == null
        ? null
        : CoronaData(
            country: Countries.byName(countryName),
            confirmed: int.parse(countryStrings[0]),
            recovered: int.parse(countryStrings[1]),
            deaths: int.parse(countryStrings[2]));
  }
}
