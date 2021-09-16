// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../const.dart';

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: kPrimaryDarkColor,
  scaffoldBackgroundColor: kPrimaryDarkColor,
  textTheme: TextTheme(bodyText1: TextStyle(fontFamily: 'Almarai', fontSize: 20.0)),
);
