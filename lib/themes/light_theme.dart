import 'package:flutter/material.dart';

import '../const.dart';

final lightTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,
      snackBarTheme: SnackBarThemeData(backgroundColor: kPrimaryColor ,contentTextStyle: TextStyle(fontFamily: 'Almarai')),

  textTheme: TextTheme(
    bodyText1:TextStyle(fontFamily:'Almarai', color: kPrimaryDarkColor , fontSize: 20.0)
  ),
);
