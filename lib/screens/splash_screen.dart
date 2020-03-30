import 'dart:async';

import 'package:corona/models/coronaData.dart';
import 'package:corona/screens/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:corona/services/prefrences.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Prefrences prefrences = Prefrences();

    var futureData = prefrences.initalizeData().then((data) {
     
     new Future.delayed(
        const Duration(seconds: 1),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  initialData: data,
                ),
              ),

              // Navigator.pushNamed(context, '/home' , arguments:(data) )
            ));

    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage('assets/images/logo.png')),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(tr('title'), style: TextStyle(fontSize: 35.0)),
          ),
          Text(tr('slogan'), style: TextStyle(fontSize: 24.0)),
        ],
      ),
    ));
  }
}
