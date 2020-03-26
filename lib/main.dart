import 'dart:js';

import 'package:corona/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:corona/providers/theme_provider.dart';
import 'package:corona/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui ;
void main() {
  // TODO : read from shared prefrences
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(isDarkMode: true),
      ),
      ChangeNotifierProvider<DataProvider>(create: (context) => DataProvider())
    ],
    child: EasyLocalization(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  
  
  @override
  
  Widget build(BuildContext context) {
  
    var data = EasyLocalizationProvider.of(context).data;
          print( ui.window.locale.languageCode);

    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return EasyLocalizationProvider(
        data: data,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'corona',
          theme: themeProvider.getTheme(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            EasyLocalizationDelegate(
              locale:  Locale.fromSubtags(languageCode: ui.window.locale.languageCode),
              path: 'assets/langs',
              useOnlyLangCode: true,
            ),
          ],
          supportedLocales: [
            Locale.fromSubtags(languageCode: 'en'),
            Locale.fromSubtags(languageCode: 'ar'),
          ],
          locale: data.locale == null
              ? Localizations.localeOf(context)
              : data.locale,
          home: HomePage(),
        ),
      );
    });
  }
}
