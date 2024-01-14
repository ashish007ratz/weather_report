import 'package:city_weather/screens/select_city.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.teal[400],
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: SelectCity(),
      );
  }
}