import 'package:flutter/material.dart';

const Color kPrimaryDarkColor = Color(0xff1A1B25);
const Color kDarkCardColor = Color(0xff242535);

const TextStyle kTitleDarkStyle =
    TextStyle(fontFamily: 'Almarai', fontSize: 30.0, fontWeight: FontWeight.w700, color: Colors.white);

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: kPrimaryDarkColor,
  cardColor: kDarkCardColor,
  primaryTextTheme: const TextTheme(headline1: kTitleDarkStyle),
  scaffoldBackgroundColor: kPrimaryDarkColor,
  textTheme: const TextTheme(bodyText1: TextStyle(fontFamily: 'Almarai', fontSize: 20.0)),
);
