import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffEB5569);

const TextStyle kTitleLightStyle =
    TextStyle(fontFamily: 'Almarai', fontSize: 25.0, fontWeight: FontWeight.w700, color: Colors.white);

final lightTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,
  cardColor: const Color(0xffDFAC29),
  backgroundColor: const Color(0xffe9c46a),
  textTheme: const TextTheme(headline1: kTitleLightStyle, bodyText1: TextStyle(fontFamily: 'Almarai', fontSize: 20.0)),
);
