import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class weathermodels {
  DateTime date;
  double temp;
  double max_temp;
  double min_temp;
  String state;

  weathermodels(
      {required this.date,
      required this.temp,
      required this.max_temp,
      required this.min_temp,
      required this.state});
  factory weathermodels.fromjson(dynamic data) {
    var josndate = data['forecast']['forecastday'][0]['day'];
    // date = data['location']['localtime'];

    // temp = josndate['avgtemp_c'];
    // max_temp = josndate['maxtemp_c'];
    // min_temp = josndate['mintemp_c'];
    // state = josndate['condition']['text'];
    return weathermodels(
        date: DateTime.parse(data['location']['localtime']),
        temp: josndate['avgtemp_c'],
        max_temp: josndate['maxtemp_c'],
        min_temp: josndate['mintemp_c'],
        state: josndate['condition']['text']);
  }
  @override
  String toString() {
    return 'tem=$temp ,max=$max_temp,min=$min_temp,stat=$state';
  }

  String getimage() {
    if (state == 'Clear' || state == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (state == 'Sleet' || state == 'Snow' || state == 'Hail') {
      return 'assets/images/snow.png';
    } else if (state == 'Light Rain' ||
        state == 'Heavy Rain' ||
        state == 'Showers' ||
        state == 'Patchy rain possible') {
      return 'assets/images/rainy.png';
    } else if (state == 'Heavy Rain') {
      return 'assets/images/cloudy.png';
    } else if (state == 'thunderstorm' || state == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getcolor() {
    if (state == 'Clear' || state == 'Light Cloud') {
      return Colors.orange;
    } else if (state == 'Sleet' || state == 'Snow' || state == 'Hail') {
      return Colors.blue;
    } else if (state == 'Light Rain' ||
        state == 'Heavy Rain' ||
        state == 'Showers') {
      return Colors.blue;
    } else if (state == 'Heavy Rain' || state == 'Patchy rain possible') {
      return Colors.blueGrey;
    } else if (state == 'thunderstorm' || state == 'Thunder') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }
}
