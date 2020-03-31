import 'package:flutter/material.dart';
import 'package:superellipse_shape/superellipse_shape.dart';

import '../const.dart';

final darkTheme = ThemeData.dark().copyWith(
    primaryColor: kPrimaryDarkColor,
    scaffoldBackgroundColor: kPrimaryDarkColor,
    snackBarTheme: SnackBarThemeData(backgroundColor: kPrimaryColor ,contentTextStyle: TextStyle(fontFamily: 'Almarai')),
  textTheme: TextTheme(
    body1:TextStyle(fontFamily:'Almarai' , fontSize: 20.0)
  ),
);
