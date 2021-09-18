import 'package:corona/providers/data_provider.dart';
import 'package:corona/services/prefs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Prefs.init();
      await Provider.of<DataProvider>(context, listen: false).init();
      Navigator.of(context).pushReplacementNamed('/home');
    });

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(image: AssetImage('assets/images/logo.png')),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(tr('title'), style: const TextStyle(fontFamily: 'Almarai', fontSize: 35.0)),
          ),
          Text(tr('slogan'), style: const TextStyle(fontFamily: 'Almarai', fontSize: 24.0)),
        ],
      ),
    ));
  }
}
