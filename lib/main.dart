import 'package:flutter/material.dart';
import 'package:weather_app1/screens/loading_screen.dart';

void main()=>runApp(WeatherApp());
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
