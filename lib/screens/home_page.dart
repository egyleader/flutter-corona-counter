import 'package:connectivity/connectivity.dart';
import 'package:corona/components/superellipse_data_card.dart';
import 'package:corona/const.dart';
import 'package:corona/models/coronaData.dart';
import 'package:corona/providers/data_provider.dart';
import 'package:corona/providers/theme_provider.dart';
import 'package:corona/services/prefrences.dart';
import 'package:corona/themes/dark_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_country/models/country.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_country/flutter_country.dart';

class HomePage extends StatelessWidget {
  HomePage({this.initialData, this.prefrencesInstance});

  final CoronaData initialData;
  final Prefrences prefrences = Prefrences();
  final SharedPreferences prefrencesInstance;

  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    DataProvider dataProvider = Provider.of<DataProvider>(context);

    final width = MediaQuery.of(context).size.width - 20.0;

    final height = MediaQuery.of(context).size.height - 20.0;

    final List<Country> countries = Countries.all();

    final color = themeProvider.isDark() ? kDarkCardColor : kLightCardColor;
    int index = countries
        .indexWhere((country) => country.alpha2Code == initialData.code);

    return SafeArea(
      child: Scaffold(
          body: Builder(
        builder: (ctx) => SafeArea(
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
                        ConnectivityResult connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.none) {
                          Scaffold.of(ctx).showSnackBar(
                            SnackBar(
                              content: Text(
                                tr('disconnected'),
                              ),
                            ),
                          );
                        }
                        index = i;
                        CoronaData data = await dataProvider.getData(
                            preferences: prefrencesInstance,
                            countryCode: countries[i].alpha2Code);
                        await prefrences.updateCountryData(prefrencesInstance,
                            data, countries[index].alpha2Code);
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
                                  EasyLocalization.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? '${country.name} ${country.flag}'
                                      : '${country.nativeName != null ? country.nativeName.translate('ara').common : country.name}  ${country.flag}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ))
                          .toList()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SuperellipseDataCard(
                        color: color,
                        width: width * .45,
                        subtitle: tr("confirmed"),
                        title: dataProvider.coronaData == null
                            ? initialData.confirmed.toString()
                            : dataProvider.coronaData.confirmed.toString(),
                        image: 'assets/images/confirmed.png'),
                    SuperellipseDataCard(
                        color: color,
                        width: width * .45,
                        subtitle: tr("recovered"),
                        title: dataProvider.coronaData == null
                            ? initialData.recovered.toString()
                            : dataProvider.coronaData.recovered.toString(),
                        image: 'assets/images/recovered.png'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SuperellipseDataCard(
                        color: color,
                        width: width * .45,
                        subtitle: tr("deaths"),
                        title: dataProvider.coronaData == null
                            ? initialData.deaths.toString()
                            : dataProvider.coronaData.deaths.toString(),
                        image: 'assets/images/deaths.png'),
                    SuperellipseDataCard(
                        color: color,
                        width: width * .45,
                        subtitle: tr("percent"),
                        title: dataProvider.coronaData == null
                            ? '${(initialData.deaths / initialData.confirmed * 100).toStringAsFixed(2)} \%'
                            : '${(dataProvider.coronaData.deaths / dataProvider.coronaData.confirmed * 100).toStringAsFixed(2)} \%',
                        image: 'assets/images/percent.png'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(tr('darkmode'), style: TextStyle(fontFamily: 'Almarai'),),
                    // switch for the dark theme with themeProvider
                    Switch(
                        value: themeProvider.isDark() ? true : false,
                        onChanged: (value) {
                          themeProvider.switchTheme();
                        }),
                    Text(tr('arabic'), style: TextStyle(fontFamily: 'Almarai'),),

                    // switch to change language with Easy Localization
                    Switch(
                        value:
                            EasyLocalization.of(context).locale.languageCode ==
                                    "ar"
                                ? false
                                : true,
                        onChanged: (value) {
                          if (EasyLocalization.of(context)
                                  .locale
                                  .languageCode ==
                              "ar") {
                            EasyLocalization.of(context).locale = Locale("en");
                          } else {
                            EasyLocalization.of(context).locale = Locale("ar");
                          }
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
