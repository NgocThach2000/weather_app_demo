import 'package:flutter/material.dart';
import 'package:weather_app/pages/city_page.dart';
import 'package:weather_app/pages/loading_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
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
        CityPage.id: (context) => CityPage(),
      },
    );
  }
}
