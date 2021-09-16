import 'package:corona/providers/data_provider.dart';
import 'package:corona/screens/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    DataProvider().init();
    // init data Provider
    FlutterSimCountryCode.simCountryCode.then((code) async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
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
            child: Text(tr('title'),
                style: TextStyle(fontFamily: 'Almarai', fontSize: 35.0)),
          ),
          Text(tr('slogan'),
              style: TextStyle(fontFamily: 'Almarai', fontSize: 24.0)),
        ],
      ),
    ));
  }
}
