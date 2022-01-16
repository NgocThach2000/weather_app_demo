import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/location_page.dart';

class LoadingPage extends StatefulWidget {
  static const String id = 'loading_page';
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void deactive() {
    super.deactivate();
  }

  Future<void> getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.of(context).pushNamed(LocationPage.id, arguments: weatherData);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
