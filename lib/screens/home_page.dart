import 'package:corona/const.dart';
import 'package:corona/providers/data_provider.dart';
import 'package:corona/providers/theme_provider.dart';
import 'package:corona/services/code_to_emoji.dart';
import 'package:corona/services/get_data.dart';
import 'package:corona/themes/dark_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corona/models/country.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    DataProvider data = Provider.of<DataProvider>(context, listen: false);
    var localeData = EasyLocalizationProvider.of(context).data;
    final String languageCode = Localizations.localeOf(context).languageCode;
    final width = MediaQuery.of(context).size.width - 20.0;
    final height = MediaQuery.of(context).size.height - 20.0;

    final List<Country> countries = Countries.countriesData();
    final int egyptIndex =
        countries.indexWhere((country) => country.countryAr == "مصر");
    print(egyptIndex);
    return EasyLocalizationProvider(
      data: localeData,
      child: SafeArea(
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
                    Image.asset('assets/images/logo.png'),
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
                      onSelectedItemChanged: (i) {
                        data.getData(countries[i].countryEn);
                      },
                      scrollController:
                          FixedExtentScrollController(initialItem: egyptIndex),
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

                // switch for the dark theme with themeProvider
                Switch(
                    value: themeProvider.getTheme() == darkTheme ? false : true,
                    onChanged: (value) {
                      themeProvider.switchTheme();
                    }),
                // switch to change language with Easy Localization
                Switch(
                    value: false,
                    onChanged: (value) {
                      if (languageCode == "ar") {
                        localeData.changeLocale(
                            locale: Locale.fromSubtags(languageCode: "en"));
                      } else {
                        localeData.changeLocale(
                            locale: Locale.fromSubtags(languageCode: "ar"));
                      }
                    }),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
