import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Provider/wather_provider.dart';
import 'package:weather/models/weather_models.dart';
import 'searchpage.dart';

class search extends StatefulWidget {
  search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  void updateui() {
    setState(() {});
  }

  weathermodels? watherdata;
  @override
  Widget build(BuildContext context) {
    watherdata = Provider.of<weatherprovidor>(context).weatherdata;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchpage(
                    updateui: updateui,
                  );
                }));
              },
              icon: Icon(Icons.search)),
        ],
        title: Text('Weather App'),
      ),
      body: watherdata == null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😔 start searching now 🔍',
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    watherdata!.getcolor(),
                    watherdata!.getcolor()[300]!,
                    watherdata!.getcolor()[100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<weatherprovidor>(context).cityname!,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'updated: ${watherdata!.date.day.toString()}/${watherdata!.date.month.toString()}/${watherdata!.date.year.toString()} ${watherdata!.date.hour.toString()}:${watherdata!.date.minute.toString()}'),
                  // 'updated: 29-7-2023', style: TextStyle(fontSize: 20)
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(watherdata!.getimage()),
                      Text(
                        watherdata!.temp.toInt().toString(),
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('maxTemp:${watherdata!.max_temp.toInt()}'),
                          Text('minTemp:${watherdata!.min_temp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    watherdata!.state,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
