import 'package:corona/models/coronaData.dart';
import 'package:corona/providers/data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class Prefrences {
  Future<SharedPreferences> getPrefrences() => SharedPreferences.getInstance();

  saveData({SharedPreferences preferences, List<String> countriesStrings}) {
    try {
      preferences.setStringList('countriesData', countriesStrings);
      print('The Saved Data is : $countriesStrings');
      print('data Saved successfully');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> getLastCountry(SharedPreferences _preferences) async {
    String _country = _preferences.getString('lastCountry');

    _country == null
        ? _country = ui.window.locale.countryCode
        : _country = _country;

    return _country;
  }

  List<CoronaData> countriesStringToCoronaData(
      List<String> _countriesDataStrings) {
    List<CoronaData> coronaData;

    for (String country in _countriesDataStrings) {
      CoronaData countryObject = CoronaData.stringToCoronaData(country);

      coronaData.add(countryObject);
    }

    return coronaData;
  }

  bool countryIsCached(List<CoronaData> _countriesCoronaData, String country) {
    for (CoronaData listItem in _countriesCoronaData) {
      listItem.country == country ? true : false;
    }
    return false;
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

  void updateCountryData(
      SharedPreferences preferences, CoronaData country) async {
    //TODO: remove this 👇
    //  await preferences.setStringList('countriesData' , []);

    List<String> countriesStrings = preferences.getStringList('countriesData');
    print('cached data : $countriesStrings');
    List<CoronaData> countriesCoronaData =
        CoronaData.stringsListToCoronaData(countriesStrings);

    List<String> countriesNames = [];

    if (countriesStrings.isEmpty) {
      countriesStrings.add(CoronaData.coronaDataToString(country));
      saveData(preferences: preferences, countriesStrings: countriesStrings);
    }

    for (CoronaData listItem in countriesCoronaData) {
      int i = 0;
      if (listItem.country == country.country) {
        countriesCoronaData[i] = country;
      }
      countriesNames.add(listItem.country);
      i++;
    }
    print(countriesNames);

    if (!countriesNames.contains(country.country)) {
      countriesCoronaData.add(country);
    }

    countriesStrings = CoronaData.coronaDataListToString(countriesCoronaData);

    saveData(preferences: preferences, countriesStrings: countriesStrings);
  }

  getCountryCachedDataByName(
      String _country, List<CoronaData> _countriesCoronaData) {
    for (var item in _countriesCoronaData) {
      if (item.country == _country) {
        return item;
      }
      ;
    }
  }

  Future<CoronaData> initalizeData() async {
    SharedPreferences _prefrences = await getPrefrences();
    print('your prefrences is : ${_prefrences.toString()}');
    String _lastCountry = await getLastCountry(_prefrences);
    print('last country is  :$_lastCountry');

    CoronaData _countryData;
    List<String> _countriesDataStrings;
    if (await _prefrences.containsKey('countriesData') != false &&
        await _prefrences.getStringList('countriesData').isNotEmpty) {
      _countriesDataStrings = await _prefrences.getStringList('countriesData');
    } else {
      print('there is no saved country ,, loaded initial country to app ');
      DataProvider dataProvider = DataProvider();
      return dataProvider.getData(_lastCountry);
    }

    print('Countries Strings  is : $_countriesDataStrings');

    List<CoronaData> _countriesCoronaData =
        CoronaData.stringsListToCoronaData(_countriesDataStrings);
    print('Countries corona Data  is : ${_countriesCoronaData.toString()}');

    bool _cached = countryIsCached(_countriesCoronaData, _lastCountry);
    print('Countries is cached ?  : $_cached');

    if (_cached == true) {
      _countryData =
          getCountryCachedDataByName(_lastCountry, _countriesCoronaData);
      print('country Data  is : ${_countryData.toString()}');
      return _countryData;
    } else {
      DataProvider dataProvider = DataProvider();
      return dataProvider.getData(_lastCountry);
    }
  }
}
