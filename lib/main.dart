import 'package:corona/providers/data_provider.dart';
import 'package:corona/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:corona/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  return runApp(
    EasyLocalization(
      path: 'assets/langs',
      supportedLocales: [Locale('en'), Locale('ar')],
      useOnlyLangCode: true,
      saveLocale: true,
      
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(isDarkMode: true),
          ),
          ChangeNotifierProvider<DataProvider>(
              create: (context) => DataProvider())
        ],
        child: MyApp(),
      ),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalization.of(context).delegate
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        
        title: 'corona',
        theme: themeProvider.getTheme(),
        home: SplashScreen(),
        routes: {
          // '/home': (context)=> HomePage(CoronaData data),
          '/splash': (context)=>SplashScreen()
        },
      );
    });
  }
}
