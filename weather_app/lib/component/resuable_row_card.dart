import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';

class ReusableRowCard extends StatelessWidget {
  const ReusableRowCard(
      {Key? key,
      required this.weatherIcon,
      required this.temperature,
      required this.description,
      this.weatherDay,
      this.weatherMonth})
      : super(key: key);

  final String? weatherIcon;
  final String? description;
  final int? temperature;
  final int? weatherDay;
  final int? weatherMonth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '${weatherIcon}  ${weatherDay}/${weatherMonth}: ${description}',
          style: kMessageTextStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${temperature}°',
          style: kMessageTextStyle,
        )
      ],
    );
  }
}
