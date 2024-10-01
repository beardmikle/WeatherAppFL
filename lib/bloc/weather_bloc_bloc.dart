import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import '../data/my_data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        print("Fetching weather for latitude: ${event.position.latitude}, longitude: ${event.position.longitude}");
        
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude, 
          event.position.longitude,
        );

        print("Weather data fetched: ${weather.toString()}");
        emit(WeatherBlocSuccess(weather));Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Проверка включена ли служба геолокации
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print('Location services are disabled.');
    return Future.error('Location services are disabled.');
  }

  // Проверка разрешений
  permission = await Geolocator.checkPermission();
  print('Current permission status: $permission');

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Location permissions are denied.');
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    print('Location permissions are permanently denied.');
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }

  // Получение текущего положения
  try {
    Position position = await Geolocator.getCurrentPosition();
    print('Current position: ${position.latitude}, ${position.longitude}');
    return position;
  } catch (e) {
    print('Failed to get position: $e');
    return Future.error('Failed to get position');
  }
}

      } catch (e) {
        print("Error fetching weather: $e");
        emit(WeatherBlocFailure());
      }
    });
  }
}





// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather/weather.dart';


// import '../data/my_data.dart';

// part 'weather_bloc_event.dart';
// part 'weather_bloc_state.dart';


// class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
//   WeatherBlocBloc() : super(WeatherBlocInitial()) {
//     on<FetchWeather>((event, emit) async {
//       emit(WeatherBlocLoading());
//       try {
//         WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        
//         // Замените координаты на жесткие значения для Нью-Йорка
//         double latitude = 40.7128;  // Широта Нью-Йорка
//         double longitude = -74.0060;  // Долгота Нью-Йорка
        
//         // Получение погоды по жестко прописанным координатам
//         Weather weather = await wf.currentWeatherByLocation(
//           latitude, 
//           longitude,
//         );
//         emit(WeatherBlocSuccess(weather));
//       } catch (e) {
//         emit(WeatherBlocFailure());
//       }
//     });
//   }
// }


// class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
//   WeatherBlocBloc() : super(WeatherBlocInitial()) {
//     on<FetchWeather>((event, emit) async {
// 			emit(WeatherBlocLoading());
//       try {
// 				WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
				
// 				Weather weather = await wf.currentWeatherByLocation(
// 					event.position.latitude, 
// 					event.position.longitude,
// 				);
// 				emit(WeatherBlocSuccess(weather));
//       } catch (e) {
//         emit(WeatherBlocFailure());
//       }
//     });
//   }
// }
