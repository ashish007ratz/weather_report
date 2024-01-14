import 'package:bloc/bloc.dart';
import 'package:weather/weather.dart';
import '../models/weather.dart';

// States
abstract class WeatherState {}

/// noting will happen while passing this state
class WeatherInitialState extends WeatherState {}

/// pass this state while loading data
class WeatherLoadingState extends WeatherState {}

/// pass this state when data is loaded
class WeatherLoadedState extends WeatherState {
  final Weather weather;

  WeatherLoadedState(this.weather);
}

/// pass this state when getting error while getting data from server
class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState(this.errorMessage);
}

// BLoC
class WeatherBloc extends Cubit<WeatherState> {

  WeatherBloc() : super(WeatherInitialState());

  /// [cityName] will be city, state, Country
  onFetchData(String cityName) async{
    /// uncomment this if we are not giving loading state at the initiliazation of the cubic
     emit(WeatherLoadingState());
    try {
      final Weather weather = await WeatherRepo.fetchWeatherByCity(cityName);
      emit(WeatherLoadedState(weather));
    } catch (e) {
      emit( WeatherErrorState("Error fetching weather data: $e"));
    }
  }
}
