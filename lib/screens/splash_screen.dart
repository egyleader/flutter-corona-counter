import 'dart:async';
import 'package:corona/screens/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:corona/services/prefrences.dart';
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

    prefrences.initalizeData().then((data) async {
      SharedPreferences prefrencesInstance = await prefrences.getPrefrences();

      new Future.delayed(
          const Duration(seconds: 1),
          () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    initialData: data,
                    prefrencesInstance: prefrencesInstance,
                  ),
                ),

                // Navigator.pushNamed(context, '/home' , arguments:(data) )
              ));
    });
  }

  @override
  void dispose() {
    super.dispose();
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
            child: Text(tr('title'), style: TextStyle(fontFamily:'Almarai' , fontSize: 35.0)),
          ),
          Text(tr('slogan'), style: TextStyle(fontFamily:'Almarai' ,fontSize: 24.0)),
        ],
      ),
    ));
  }
}
