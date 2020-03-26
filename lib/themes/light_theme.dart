import 'package:flutter/material.dart';

import '../const.dart';

final lightTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,
  textTheme: TextTheme(
    body1:TextStyle(fontFamily:'Almarai', color: kPrimaryDarkColor , fontSize: 20.0)
  ),
);
