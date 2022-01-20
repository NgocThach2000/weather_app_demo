import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/uidata.dart';
import 'package:weather_app/component/resuable_row_card.dart';

class ForecastPage extends StatefulWidget {
  static String id = 'forecast_page';
  final List<Weather> ListDataWeather;
  const ForecastPage({
    Key? key,
    required this.ListDataWeather,
  }) : super(key: key);

  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  List<Weather>? weatherItem;
  @override
  void initState() {
    super.initState();
    updateUI(widget.ListDataWeather);
  }

  void updateUI(List<Weather> ListDataWeather) {
    weatherItem = widget.ListDataWeather;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(UIData.backgroundImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 50.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 50),
                      child: Text(
                        'Forecast for 5 days',
                        style: kTitleTextStyle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          ReusableRowCard(
                            weatherIcon: weatherItem![1].weatherIcon,
                            temperature: weatherItem![1].temperature,
                            description: weatherItem![1].description,
                            weatherMonth: weatherItem![1].dayOfDateTime!.month,
                            weatherDay: weatherItem![1].dayOfDateTime!.day,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ReusableRowCard(
                            weatherIcon: weatherItem![2].weatherIcon,
                            temperature: weatherItem![2].temperature,
                            description: weatherItem![2].description,
                            weatherMonth: weatherItem![2].dayOfDateTime!.month,
                            weatherDay: weatherItem![2].dayOfDateTime!.day,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ReusableRowCard(
                            weatherIcon: weatherItem![3].weatherIcon,
                            temperature: weatherItem![3].temperature,
                            description: weatherItem![3].description,
                            weatherMonth: weatherItem![3].dayOfDateTime!.month,
                            weatherDay: weatherItem![3].dayOfDateTime!.day,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ReusableRowCard(
                            weatherIcon: weatherItem![4].weatherIcon,
                            temperature: weatherItem![4].temperature,
                            description: weatherItem![4].description,
                            weatherMonth: weatherItem![4].dayOfDateTime!.month,
                            weatherDay: weatherItem![4].dayOfDateTime!.day,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ReusableRowCard(
                            weatherIcon: weatherItem![5].weatherIcon,
                            temperature: weatherItem![5].temperature,
                            description: weatherItem![5].description,
                            weatherMonth: weatherItem![5].dayOfDateTime!.month,
                            weatherDay: weatherItem![5].dayOfDateTime!.day,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
