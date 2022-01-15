import 'package:flutter/material.dart';
import 'package:weather_app/pages/city_page.dart';
import 'package:weather_app/pages/loading_page.dart';
import 'package:weather_app/pages/location_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: LoadingPage.id,
      routes: {
        LoadingPage.id: (context) => LoadingPage(),
        LocationPage.id: (context) => LocationPage(),
        CityPage.id: (context) => CityPage(),
      },
    );
  }
}
