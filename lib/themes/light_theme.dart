import 'package:flutter/material.dart';

const Color kLightCardColor = Color(0xffE3E9ED);
const Color kPrimaryColor = Color(0xffEB5569);

const TextStyle kTitleLightStyle = TextStyle(
    fontFamily: 'Almarai',
    fontSize: 30.0,
    fontWeight: FontWeight.w700);

final lightTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,
  cardColor: kLightCardColor ,
  primaryTextTheme:const TextTheme(headline1: kTitleLightStyle),
  textTheme: const TextTheme(
    bodyText1:TextStyle(fontFamily:'Almarai', fontSize: 20.0)
  ),
);
