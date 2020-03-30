import 'package:corona/components/superellipse_card.dart';
import 'package:corona/const.dart';
import 'package:corona/models/coronaData.dart';
import 'package:corona/providers/data_provider.dart';
import 'package:corona/providers/theme_provider.dart';
import 'package:corona/services/code_to_emoji.dart';
import 'package:corona/services/prefrences.dart';
import 'package:corona/themes/dark_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corona/models/country.dart';
import 'dart:ui' as ui;

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({this.initialData , this.prefrencesInstance});

  final CoronaData initialData;
  final Prefrences prefrences = Prefrences();
  final SharedPreferences prefrencesInstance;

  Widget build(BuildContext context) {

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    DataProvider dataProvider = Provider.of<DataProvider>(context);

    final String languageCode =
        EasyLocalization.of(context).locale.languageCode;

    final width = MediaQuery.of(context).size.width - 20.0;

    final height = MediaQuery.of(context).size.height - 20.0;

    final List<Country> countries = Countries.countriesData();

    int index = countries
        .indexWhere((country) => country.code == ui.window.locale.countryCode);

    return SafeArea(
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    height: 64.0,
                  ),
                  SizedBox(width: width * 0.03),
                  Text(
                    tr('title'),
                    style: themeProvider.isDark()
                        ? kTitleDarkStyle
                        : kTitleLightStyle,
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.2,
                child: CupertinoPicker(
                    onSelectedItemChanged: (i) async {
                      index = i;
                      CoronaData data =
                      await dataProvider.getData(preferences: prefrencesInstance , countryName: countries[i].countryEn);
                      prefrences.updateCountryData(prefrencesInstance, data);
                    },
                    scrollController:
                        FixedExtentScrollController(initialItem: index),
                    offAxisFraction: .1,
                    diameterRatio: 1.1,
                    itemExtent: 50.0,
                    magnification: 1.4,
                    backgroundColor: themeProvider.getTheme() == darkTheme
                        ? kPrimaryDarkColor
                        : Colors.white,
                    squeeze: 1.45,
                    useMagnifier: true,
                    looping: true,
                    children: countries
                        .map((country) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                languageCode == "en"
                                    ? '${country.countryEn} ${codeToEmoji(country.code)}'
                                    : '${country.countryAr}  ${codeToEmoji(country.code)}',
                                style: Theme.of(context).textTheme.body1,
                              ),
                            ))
                        .toList()),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SuperellipseCard(
                    color: themeProvider.isDark()
                        ? kDarkCardColor
                        : kLightCardColor,
                    size: width * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/confirmed.png',
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        Text(tr("confirmed")),
                        Text(
                          dataProvider.coronaData == null
                              ? initialData.confirmed.toString()
                              : dataProvider.coronaData.confirmed.toString(),
                          style: TextStyle(
                              color: kPrimaryColor, fontSize: width * 0.1),
                        ),
                      ],
                    ),
                  ),
                  SuperellipseCard(
                    color: themeProvider.isDark()
                        ? kDarkCardColor
                        : kLightCardColor,
                    size: width * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/recovered.png',
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        Text(tr("recovered")),
                        Text(
                          dataProvider.coronaData == null
                              ? initialData.recovered.toString()
                              : dataProvider.coronaData.recovered.toString(),
                          style: TextStyle(
                              color: kPrimaryColor, fontSize: width * 0.1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SuperellipseCard(
                    color: themeProvider.isDark()
                        ? kDarkCardColor
                        : kLightCardColor,
                    size: width * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/deaths.png',
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        Text(tr("deaths")),
                        Text(
                          dataProvider.coronaData == null
                              ? initialData.deaths.toString()
                              : dataProvider.coronaData.deaths.toString(),
                          style: TextStyle(
                              color: kPrimaryColor, fontSize: width * 0.1),
                        ),
                      ],
                    ),
                  ),
                  SuperellipseCard(
                    color: themeProvider.isDark()
                        ? kDarkCardColor
                        : kLightCardColor,
                    size: width * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/percent.png',
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        Text(tr("percent")),
                        Text(
                          dataProvider.coronaData == null
                              ? '${(initialData.deaths / initialData.confirmed * 100).toStringAsFixed(2)} \%'
                              : '${(dataProvider.coronaData.deaths / dataProvider.coronaData.confirmed * 100).toStringAsFixed(2)} \%',
                          style: TextStyle(
                              color: kPrimaryColor, fontSize: width * 0.1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // switch for the dark theme with themeProvider
              Switch(
                  value: themeProvider.getTheme() == darkTheme ? false : true,
                  onChanged: (value) {
                    themeProvider.switchTheme();
                  }),
              // switch to change language with Easy Localization
              Switch(
                  value: languageCode == "ar" ? false : true,
                  onChanged: (value) {
                    print('switch Language code : $languageCode');
                    if (languageCode == "ar") {
                      EasyLocalization.of(context).locale = Locale("en");
                    } else {
                      EasyLocalization.of(context).locale = Locale("ar");
                    }
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
