import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapp3/bloc/weather_bloc_bloc.dart';
import 'package:tapp3/screens/home_screen.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _determinePosition(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            print('Waiting for position to be determined...');
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snap.hasData) {
            print('Position determined: ${snap.data}'); // Выводим позицию
            return BlocProvider<WeatherBlocBloc>(
              create: (context) => WeatherBlocBloc()
                ..add(FetchWeather(snap.data as Position)),
              child: const HomeScreen(),
            );
          } else if (snap.hasError) {
            // Вывод ошибки в консоль
            print('Error occurred while determining position: ${snap.error}');
            return const Scaffold(
              body: Center(
                child: Text('Error: Failed to determine position!'),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

/// Determine the current position of the device.
/// If it takes longer than 6 seconds, an error is returned.
Future<Position> _determinePosition() async {
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

  // Получение текущего положения с таймаутом
  try {
    Position position = await Geolocator.getCurrentPosition().timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        print('Error: Determining position timed out after 6 seconds.');
        throw Exception('Determining position timed out');
      },
    );
    print('Current position: ${position.latitude}, ${position.longitude}');
    return position;
  } catch (e) {
    print('Failed to get position: $e');

    // Возвращаем фиксированную позицию (например, для Нью-Йорка) при таймауте
    Position fallbackPosition = Position(
      latitude: 40.7128, // Широта Нью-Йорка
      longitude: -74.0060, // Долгота Нью-Йорка
      timestamp: DateTime.now(),
      accuracy: 1.0,
      altitude: 1.0,
      heading: 1.0,
      speed: 1.0,
      speedAccuracy: 1.0,
      altitudeAccuracy: 1.0, // Новый обязательный параметр
      headingAccuracy: 1.0, // Новый обязательный параметр
    );
    print('Using fallback position: ${fallbackPosition.latitude}, ${fallbackPosition.longitude}');
    return fallbackPosition;
  }
}
