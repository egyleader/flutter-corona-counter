import 'package:connectivity/connectivity.dart';
import 'package:corona/components/superellipse_data_card.dart';
import 'package:corona/providers/data_provider.dart';
import 'package:corona/providers/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:countries_utils/models/country.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:countries_utils/flutter_country.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);

    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    final width = MediaQuery.of(context).size.width - 20.0;

    final height = MediaQuery.of(context).size.height - 20.0;

    // cpnvery available countries name list to a list of Country opjects
    final List<Country> _countries = [];

    dataProvider.countriesAvailable.forEach((country) {
      try {
        _countries.add(Countries.byName(country));
      } catch (e) {
        debugPrint('country : $country not found ');
      }
    });

    int index = _countries.indexWhere((country) => country.alpha2Code == dataProvider.coronaData.country.alpha2Code);

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
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
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.2,
                    child: CupertinoPicker(
                        onSelectedItemChanged: (i) async {
                          ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
                          if (connectivityResult == ConnectivityResult.none) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(tr('disconnected'))));
                          }
                          index = i;
                          dataProvider.getCountryCoronaData(_countries[index].name.toString());
                        },
                        scrollController: FixedExtentScrollController(initialItem: index),
                        offAxisFraction: .1,
                        diameterRatio: 1.1,
                        itemExtent: 50.0,
                        magnification: 1.4,
                        backgroundColor: Theme.of(context).backgroundColor,
                        squeeze: 1.45,
                        useMagnifier: true,
                        looping: true,
                        children: _countries
                            .map((country) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    EasyLocalization.of(context)?.locale.languageCode == "en"
                                        ? '${country.name} ${country.flagIcon}'
                                        : '${country.nativeName != null ? country.translate(context.locale.languageCode) : country.name}  ${country.flagIcon}',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ))
                            .toList()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SuperellipseDataCard(
                          color: Theme.of(context).cardColor,
                          width: width * .45,
                          subtitle: tr("confirmed"),
                          title: dataProvider.coronaData.confirmed.toString(),
                          image: 'assets/images/confirmed.png'),
                      SuperellipseDataCard(
                          color: Theme.of(context).cardColor,
                          width: width * .45,
                          subtitle: tr("recovered"),
                          title: dataProvider.coronaData.recovered.toString(),
                          image: 'assets/images/recovered.png'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SuperellipseDataCard(
                          color: Theme.of(context).cardColor,
                          width: width * .45,
                          subtitle: tr("deaths"),
                          title: dataProvider.coronaData.deaths.toString(),
                          image: 'assets/images/deaths.png'),
                      SuperellipseDataCard(
                          color: Theme.of(context).cardColor,
                          width: width * .45,
                          subtitle: tr("percent"),
                          title: dataProvider.coronaData == null
                              ? '-'
                              : '${(dataProvider.coronaData.deaths / dataProvider.coronaData.confirmed * 100).toStringAsFixed(2)} %',
                          image: 'assets/images/percent.png'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        tr('darkmode'),
                        style: const TextStyle(fontFamily: 'Almarai'),
                      ),
                      // switch for the dark theme with themeProvider
                      Switch(
                          value: themeProvider.isDark() ? true : false,
                          onChanged: (value) {
                            themeProvider.switchTheme();
                          }),
                      Text(
                        tr('arabic'),
                        style: const TextStyle(fontFamily: 'Almarai'),
                      ),

                      // switch to change language with Easy Localization
                      Switch(
                          value: EasyLocalization.of(context)?.locale.languageCode == "ar" ? false : true,
                          onChanged: (value) {
                            if (EasyLocalization.of(context)?.locale.languageCode == "ar") {
                              EasyLocalization.of(context)?.setLocale(const Locale("en"));
                            } else {
                              EasyLocalization.of(context)?.setLocale(const Locale("ar"));
                            }
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
