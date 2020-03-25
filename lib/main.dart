import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:corona/providers/theme_provider.dart';
import 'package:corona/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  // TODO : read from shared prefrences
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(isDarkMode: true),
      ),
    ],
    child: EasyLocalization(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;

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
              locale: data.locale,
              path: 'assets/langs',
              useOnlyLangCode: true,
              // loadPath: 'https://raw.githubusercontent.com/aissat/easy_localization/master/example/resources/langs'
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
