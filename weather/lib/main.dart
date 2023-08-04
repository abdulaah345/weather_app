import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:weather/Provider/wather_provider.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/pages/search.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return weatherprovidor();
      },
      child: weatherapp()));
}

class weatherapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<weatherprovidor>(context).weatherdata ==
                  null
              ? Colors.blue
              : Provider.of<weatherprovidor>(context).weatherdata!.getcolor()),
      debugShowCheckedModeBanner: false,
      home: search(),
    );
  }
}
