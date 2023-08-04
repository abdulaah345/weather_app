import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Provider/wather_provider.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/services/waether_services.dart';

class searchpage extends StatelessWidget {
  String? namecity;
  searchpage({this.updateui});
  VoidCallback? updateui;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFAC3F),
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              namecity = data;
            },
            onSubmitted: (data) async {
              namecity = data;
              watherservices service = watherservices();
              weathermodels? weather =
                  await service.getweather(cityname: namecity!);
              Provider.of<weatherprovidor>(context, listen: false).weatherdata =
                  weather;
              Provider.of<weatherprovidor>(context, listen: false).cityname =
                  namecity;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                label: Text('Search'),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      watherservices service = watherservices();
                      weathermodels? weather =
                          await service.getweather(cityname: namecity!);
                      Provider.of<weatherprovidor>(context, listen: false)
                          .weatherdata = weather;
                      Provider.of<weatherprovidor>(context, listen: false)
                          .cityname = namecity;

                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFFAC3F)),
                ),
                hintText: 'Enter a City'),
          ),
        ),
      ),
    );
  }
}
