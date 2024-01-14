import 'package:city_weather/screens/weather_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/weather.dart';
import '../models/raw_data.dart';

class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  String? selectedState;
  List<String> get cities => selectedState != null? getCities(selectedState!) : [];

  String? selectedCity;
  bool get isButtonEnabled => selectedCity != null;
  late List<String> states ;
  @override
  void initState() {
    states = indiaStateCities.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: Text('City Selection'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 350
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedState,
                    decoration: InputDecoration(
                      labelText: 'Select State',
                      border: OutlineInputBorder(),
                    ),
                    items: states.map((String state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedState = value;
                        selectedCity = null;
                      });
                    },
                  ),
                ),
                if (selectedState != null) ...[
                  SizedBox(height: 20),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: 350
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedCity,
                      decoration: InputDecoration(
                        labelText: 'Select City',
                        border: OutlineInputBorder(),
                      ),
                      items: cities.map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                    ),
                  ),
                ],
                SizedBox(height: 20),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1.0, end: isButtonEnabled ? 1.2 : 1.0),
                  duration: Duration(milliseconds: 500),
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return isButtonEnabled ? Colors.indigo : Colors.grey[300]!;
                            },
                          ),
                        ),
                        onPressed: isButtonEnabled
                            ? () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> WeatherDetail(selectedCity!)));
                          }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Select',
                            style: TextStyle(fontSize: 20, color: isButtonEnabled ? Colors.white : Colors.grey[800]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}
