import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/uidata.dart';
import 'package:weather_app/models/weather_brain.dart';
import 'package:weather_app/pages/city_page.dart';
import 'package:weather_app/models/weather.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/component/resuable_row_card.dart';

class LocationPage extends StatefulWidget {
  static String id = 'location_page';
  final locationWeather;
  final locationWeatherForecast;

  const LocationPage({
    Key? key,
    required this.locationWeather,
    this.locationWeatherForecast,
  }) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  WeatherModel weatherModel = WeatherModel();
  int? temperature;
  int? condition;
  String? weatherIcon;
  String? weatherMessage;
  String? cityName;
  String? description;
  DateTime? dayOfDateTime;
  List<Weather>? weatherItem = [];

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather, widget.locationWeatherForecast);
    // print(widget.locationWeatherForecast);
  }

  void updateUI(dynamic weatherData, dynamic weatherForecastData) {
    setState(
      () {
        weatherItem!.clear();
        if (weatherData == null || weatherForecastData == null) {
          temperature = 0;
          weatherIcon = 'Error';
          weatherMessage = 'Unable to get weather data';
          cityName = '';
          description = '';
          weatherItem!.add(
            Weather(
              temperature: temperature,
              weatherMessage: weatherMessage,
              condition: condition,
              weatherIcon: weatherIcon,
              cityName: cityName,
              description: description,
            ),
          );
          for (int i = 0; i < 40; i += 8) {
            if (i == 8) {
              i = i - 1;
            }
            temperature = 0;
            weatherMessage = "Unable to get weather data";
            condition = 0;
            weatherIcon = "Error";
            cityName = "";
            description = "";
            weatherItem!.add(
              Weather(
                temperature: temperature,
                weatherMessage: weatherMessage,
                condition: condition,
                weatherIcon: weatherIcon,
                cityName: cityName,
                description: description,
              ),
            );
          }
          return;
        } else {
          double temp = weatherData['main']['temp'];
          temperature = temp.toInt();
          weatherMessage = weatherModel.getMessage(temperature!);
          condition = weatherData['weather'][0]['id'];
          weatherIcon = weatherModel.getWeatherIcon(condition!);
          cityName = weatherData['name'];
          description = weatherData['weather'][0]['description'];
          weatherItem!.add(
            Weather(
              temperature: temperature,
              weatherMessage: weatherMessage,
              condition: condition,
              weatherIcon: weatherIcon,
              cityName: cityName,
              description: description,
            ),
          );
          for (int i = 0; i < 40; i += 8) {
            if (i == 8) {
              i = i - 1;
            }
            double temp = weatherForecastData['list'][i]['main']['temp'];
            temperature = temp.toInt();
            weatherMessage = weatherModel.getMessage(temperature!);
            condition = weatherForecastData['list'][i]['weather'][0]['id'];
            weatherIcon = weatherModel.getWeatherIcon(condition!);
            cityName = weatherForecastData['city']['name'];
            description =
                weatherForecastData['list'][i]['weather'][0]['description'];
            String timeWeather = weatherForecastData['list'][i]['dt_txt'];
            dayOfDateTime =
                DateFormat("yyyy-MM-dd hh:mm:ss").parse(timeWeather);
            weatherItem!.add(
              Weather(
                temperature: temperature,
                weatherMessage: weatherMessage,
                condition: condition,
                weatherIcon: weatherIcon,
                cityName: cityName,
                description: description,
                dayOfDateTime: dayOfDateTime,
              ),
            );
          }
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
            '${weatherItem![0].cityName}',
            style: kNormalTextStyle,
          ),
        ),
        leading: FlatButton(
          onPressed: () async {
            var weatherData = await weatherModel.getLocationWeather();
            var weatherForecastData =
                await weatherModel.getLocationWeatherForecast();
            updateUI(weatherData, weatherForecastData);
          },
          child: Icon(
            Icons.refresh,
            size: 30,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              var typedName = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CityPage();
                }),
              );
              if (typedName != null) {
                var weatherData = await weatherModel.getCityWeather(typedName);
                var weatherForecastData =
                    await weatherModel.getCityWeatherForecast(typedName);
                updateUI(weatherData, weatherForecastData);
              }
            },
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
                                  '${weatherItem![0].temperature}°',
                                  style: kTempTextStyle,
                                ),
                                Text(
                                  '${weatherItem![0].weatherIcon}',
                                  style: kConditionTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${weatherItem![0].description}',
                            style: kTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '(${weatherItem![0].weatherMessage} in ${weatherItem![0].cityName})',
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
                                  ReusableRowCard(
                                    weatherIcon: weatherItem![1].weatherIcon,
                                    temperature: weatherItem![1].temperature,
                                    description: weatherItem![1].description,
                                    weatherMonth:
                                        weatherItem![1].dayOfDateTime!.month,
                                    weatherDay:
                                        weatherItem![1].dayOfDateTime!.day,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ReusableRowCard(
                                    weatherIcon: weatherItem![2].weatherIcon,
                                    temperature: weatherItem![2].temperature,
                                    description: weatherItem![2].description,
                                    weatherMonth:
                                        weatherItem![2].dayOfDateTime!.month,
                                    weatherDay:
                                        weatherItem![2].dayOfDateTime!.day,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ReusableRowCard(
                                    weatherIcon: weatherItem![3].weatherIcon,
                                    temperature: weatherItem![3].temperature,
                                    description: weatherItem![3].description,
                                    weatherMonth:
                                        weatherItem![3].dayOfDateTime!.month,
                                    weatherDay:
                                        weatherItem![3].dayOfDateTime!.day,
                                  )
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
