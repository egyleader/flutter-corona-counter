import 'package:flutter/material.dart';

const Color kPrimaryDarkColor = Color(0xff1A1B25);


const TextStyle kTitleDarkStyle =
    TextStyle(fontFamily: 'Almarai', fontSize: 25.0, fontWeight: FontWeight.w700, color: Colors.white);

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: kPrimaryDarkColor,
  cardColor: const Color(0xff242535),
  backgroundColor: kPrimaryDarkColor,
  scaffoldBackgroundColor: kPrimaryDarkColor,
  textTheme: const TextTheme(headline1: kTitleDarkStyle, bodyText1: TextStyle(fontFamily: 'Almarai', fontSize: 20.0)),
);
