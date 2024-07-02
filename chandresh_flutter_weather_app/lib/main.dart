import 'package:chandresh_flutter_weather_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:chandresh_flutter_weather_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/loading" : (context) => Loading(),
    },
  ));
}
