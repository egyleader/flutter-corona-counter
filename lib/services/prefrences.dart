import 'package:corona/models/coronaData.dart';
import 'package:corona/models/country.dart';
import 'package:corona/providers/data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class Prefrences {
  Future<SharedPreferences> getPrefrences() => SharedPreferences.getInstance();

  saveData(
      {SharedPreferences preferences,
      List<String> countriesData,
      List<String> countriesNames}) {
    try {
      preferences.setStringList('countriesData', countriesData);
      preferences.setStringList('countriesNames', countriesNames);
      print('The Saved Data is : $countriesData');
      print('The Saved countries is : $countriesNames');
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

  void updateCountryData(
      SharedPreferences preferences, CoronaData country) async {
    //TODO: remove this 👇
    //  await preferences.setStringList('countriesData' , []);

    List<String> countriesStrings = preferences.getStringList('countriesData');

    List<String> countriesNames = [];

    if (countriesStrings == null || countriesStrings == []) {
      countriesStrings = [];
      countriesStrings.add(CoronaData.coronaDataToString(country));
      saveData(
          preferences: preferences,
          countriesData: countriesStrings,
          countriesNames: [country.country]);
    }
    List<CoronaData> countriesCoronaData =
        CoronaData.stringsListToCoronaData(countriesStrings);

    for (CoronaData listItem in countriesCoronaData) {
      int i = 0;
      if (listItem.country == country.country) {
        countriesCoronaData[i] = country;
      }
      countriesNames.add(listItem.country);
      i++;
    }

    if (!countriesNames.contains(country.country)) {
      countriesCoronaData.add(country);
      countriesNames.add(country.country);
    }
    print(countriesNames);

    countriesStrings = CoronaData.coronaDataListToString(countriesCoronaData);

    saveData(
        preferences: preferences,
        countriesData: countriesStrings,
        countriesNames: countriesNames);
  }

  CoronaData getCountryByName(
      String _country, List<CoronaData> _countriesCoronaData) {
    for (CoronaData item in _countriesCoronaData) {
      if (item.country == _country) {
        return item;
      }
    }
  }

  Future<CoronaData> initalizeData() async {
    SharedPreferences _prefrences = await getPrefrences();
    final List<Country> countries = Countries.countriesData();

    int index = countries
        .indexWhere((country) => country.code == ui.window.locale.countryCode);

    DataProvider dataProvider = DataProvider();
    CoronaData data = await dataProvider.getData(
        countryName: countries[index].countryEn, preferences: _prefrences);
    return data;
  }
}
