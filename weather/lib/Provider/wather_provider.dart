import 'package:flutter/cupertino.dart';
import 'package:weather/models/weather_models.dart';

class weatherprovidor extends ChangeNotifier {
  weathermodels? _weatherdata;
  String? cityname;
  set weatherdata(weathermodels? weather) {
    _weatherdata = weather;
    notifyListeners();
  }

  weathermodels? get weatherdata => _weatherdata;
}
