import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_models.dart';

class watherservices {
  String basdurl = 'http://api.weatherapi.com/v1';
  String urlkey = 'a01400b76c76425ab53160731232807';
  Future<weathermodels?> getweather({required String cityname}) async {
    weathermodels? weather;
    try {
      Uri url =
          Uri.parse('$basdurl/forecast.json?key=$urlkey&q=$cityname&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = weathermodels.fromjson(data);
      // print(data);
    } catch (e) {
      print(e);
    }

    return weather;
  }
}
