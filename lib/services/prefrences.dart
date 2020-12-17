import 'package:corona/models/coronaData.dart';
import 'package:corona/providers/data_provider.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Prefrences {
  Future<SharedPreferences> getPrefrences() => SharedPreferences.getInstance();

  saveData(
      {SharedPreferences preferences,
      List<String> countriesData,
      List<String> countriesCodes}) {
    try {
      preferences.setStringList('countriesData', countriesData);
      preferences.setStringList('countriesCodes', countriesCodes);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  List<CoronaData> countriesStringToCoronaData(
      List<String> _countriesDataStrings) {
    List<CoronaData> coronaData = [];

    for (String country in _countriesDataStrings) {
      CoronaData countryObject = CoronaData.stringToCoronaData(country);

      coronaData.add(countryObject);
    }

    return coronaData;
  }

  void saveCountries(
      List<CoronaData> coronaData, SharedPreferences preferences) async {
    List<String> newCountriesData;

    for (var dataItem in coronaData) {
      String dataString = CoronaData.coronaDataToString(dataItem);
      newCountriesData.add(dataString);
    }

    await preferences.setStringList('countriesData', newCountriesData);
  }

  Future<bool> updateCountryData(
      SharedPreferences preferences, CoronaData countryData, String code) async {
    List<String> countriesStrings = preferences.getStringList('countriesData');

    List<String> countriesCodes = preferences.getStringList('countriesCodes');

    if (countriesCodes == []) {
      saveData(
          preferences: preferences,
          countriesData: [CoronaData.coronaDataToString(countryData)],
          countriesCodes: [code]);
      return true;
    }

    List<CoronaData> countriesCoronaData =
        CoronaData.stringsListToCoronaData(countriesStrings);
    for (CoronaData listItem in countriesCoronaData) {
      if (listItem.code == countryData.code) {
        listItem = countryData;
      }
    }

    if (!countriesCodes.contains(countryData.code)) {
      countriesCoronaData.add(countryData);
      countriesCodes.add(countryData.code);
    }

    countriesStrings = CoronaData.coronaDataListToString(countriesCoronaData);

    saveData(
        preferences: preferences,
        countriesData: countriesStrings,
        countriesCodes: countriesCodes);
    return true;
  }

  CoronaData getCountryByCode(
      String _code, List<CoronaData> _countriesCoronaData) {
    CoronaData country =
        _countriesCoronaData.singleWhere((country) => country.code == _code);
    return country;
  }

  Future<CoronaData> initalizeData() async {
    SharedPreferences _prefrences = await getPrefrences();

    String _code;
    if (_prefrences.getString('lastCountry') == null ||
        _prefrences.getString('lastCountry') == '') {
      _code = await FlutterSimCountryCode.simCountryCode;
      _prefrences.setString('lastCountry', _code);
    } else {
      _code = _prefrences.getString('lastCountry');
    }

    _prefrences.setStringList('countriesData', []);
    _prefrences.setStringList('countriesCodes', []);
    DataProvider dataProvider = DataProvider();
    CoronaData data = await dataProvider.getData(  countryCode: _code, preferences: _prefrences);
    return data;
  }
}
