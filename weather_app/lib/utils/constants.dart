import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100,
);

const kConditionTextStyle = TextStyle(
  fontSize: 50,
);

const kTitleTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 35,
);

const kIconTextStyle = TextStyle(
  fontSize: 30,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20,
);

const kNormalTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 25,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
