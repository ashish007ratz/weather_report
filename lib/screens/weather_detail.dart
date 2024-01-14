import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import '../bloc/weather.dart';

class WeatherDetail extends StatefulWidget {
  final String city;// get city from args
  const WeatherDetail(this.city, {super.key});

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  final weatherBloc = WeatherBloc();///initialize weatherBloc

  @override
  void initState() {
    /// initialize and fetch the data from bloc
    weatherBloc.onFetchData("${widget.city}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Weather Report')),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        listener: (context, state){},
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherErrorState) {
            return Center(child: Column(
              children: [
                const Text("Error Loading Page",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                Text(state.errorMessage, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),),
              ],
            ));
          } else if (state is WeatherLoadedState) {
            final Weather weather = state.weather;
            return  Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.indigo],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weather.areaName ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '${weather.temperature?.celsius?.toStringAsFixed(2)}°C',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      weather.weatherDescription ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Image.network(
                      'https://openweathermap.org/img/w/${weather.weatherIcon}.png',
                      scale: 1,
                      height: 50,width: 50,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.thermostat,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Min: ${weather.tempMin?.celsius?.toStringAsFixed(2)}°C',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),overflow: TextOverflow.fade,
                        ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.thermostat_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Max: ${weather.tempMax?.celsius?.toStringAsFixed(2)}°C',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.water,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Humidity: ${weather.humidity}%',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                          SizedBox(width: 16),
                          Icon(
                            Icons.air,
                            color: Colors.lightBlueAccent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Wind: ${weather.windSpeed?.toStringAsFixed(1)} m/s',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
