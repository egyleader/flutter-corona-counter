import 'dart:convert';

import 'package:http/http.dart' as http;

getData(String country) async {

  if(country == "Palestin" ) country = "Israel" ;
  
  final response = await http.get(
      'https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=$country',
      headers: {
        'x-rapidapi-host': 'covid-19-coronavirus-statistics.p.rapidapi.com',
        'x-rapidapi-key': 'bb41ead216msh312599d519776eap1d913cjsna46ca0ea9471',
      });

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    print(data);
    print('==============================================');
  } else {
    print(response.statusCode);
    // throw Exception('Failed to load Data ');
  }
}
