import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/uidata.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/city_page.dart';

class LocationPage extends StatefulWidget {
  static String id = 'location_page';
  final locationWeather;

  const LocationPage({
    Key? key,
    required this.locationWeather,
  }) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  WeatherModel weatherNow = WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? weatherMessage;
  String? cityName;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          temperature = 0;
          weatherIcon = 'Error';
          weatherMessage = 'Unable to get weather data';
          cityName = '';
          return;
        } else {
          double temp = weatherData['main']['temp'];
          temperature = temp.toInt();
          weatherMessage = weatherNow.getMessage(temperature!);
          var condition = weatherData['weather'][0]['id'];
          weatherIcon = weatherNow.getWeatherIcon(condition);
          cityName = weatherData['name'];
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '$cityName',
            style: kNormalTextStyle,
          ),
        ),
        leading: FlatButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Icon(
              Icons.location_city,
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
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
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '$temperature°',
                                  style: kTempTextStyle,
                                ),
                                Text(
                                  '$weatherIcon',
                                  style: kConditionTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Cloud',
                            style: kTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '($weatherMessage in $cityName)',
                            style: kMessageTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '🌩  Today: Sunshine',
                                        style: kNormalTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '25°',
                                        style: kNormalTextStyle,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '🌩  Today: Sunshine',
                                        style: kNormalTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '25°',
                                        style: kNormalTextStyle,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '🌩  Today: Sunshine',
                                        style: kNormalTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '25°',
                                        style: kNormalTextStyle,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'forecast for 5 days',
                                style: kMessageTextStyle,
                              ),
                              foregroundDecoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              constraints: BoxConstraints(maxWidth: 330),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
