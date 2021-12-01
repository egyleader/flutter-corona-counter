import 'package:corona/providers/data_provider.dart';
import 'package:corona/screens/home_page.dart';
import 'package:corona/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:corona/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  return runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('ar')],
      useOnlyLangCode: true,
      saveLocale: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(isDarkMode: true),
          ),
          ChangeNotifierProvider<DataProvider>(create: (context) => DataProvider())
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: EasyLocalization.of(context)!.supportedLocales,
        locale: context.locale,
        title: 'corona',
        theme: themeProvider.getTheme(),
        home: const SplashScreen(),
        routes: {'/home': (context) => const HomePage(), '/splash': (context) => const SplashScreen()});
  }
}
