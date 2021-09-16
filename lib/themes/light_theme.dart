// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../const.dart';

final lightTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,

  textTheme: TextTheme(
    bodyText1:TextStyle(fontFamily:'Almarai', color: kPrimaryDarkColor , fontSize: 20.0)
  ),
);
