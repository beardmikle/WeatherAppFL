import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tapp3/bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



 	Widget getIconForWeatherMain(int code) {
		switch (code) {
		  case >= 200 && < 300 :
		    return Image.asset(
					'assets/1.png'
				);
			case >= 300 && < 400 :
		    return Image.asset(
					'assets/2.png'
				);
			case >= 500 && < 600 :
		    return Image.asset(
					'assets/3.png'
				);
			case >= 600 && < 700 :
		    return Image.asset(
					'assets/4.png'
				);
			case >= 700 && < 800 :
		    return Image.asset(
					'assets/5.png'
				);
			case == 800 :
		    return Image.asset(
					'assets/6.png',
          scale: 8,
				);
			case > 800 && <= 804 :
		    return Image.asset(
					'assets/7.png'
				);
		  default:
			return Image.asset(
				'assets/7.png'
			);
		}
	}

String getGreetingMessage(DateTime date) {
  int hour = date.hour;

  if (hour >= 6 && hour < 12) {
    return 'Good Morning';
  } else if (hour >= 12 && hour < 18) {
    return 'Good Afternoon'; // Добавлено "Afternoon" для периода после 12:00
  } else {
    return 'Good Evening'; // Вместо "Good Night" лучше использовать "Good Evening" для вечернего времени
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 1.2 * kToolbarHeight, 10, 5),
        child: SizedBox(
           height: MediaQuery.of(context).size.height,
           child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(4, -0.1),
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 233, 38, 223)
                  ),
                ),
              ),
             Align(
                alignment: const AlignmentDirectional(-4, -0.1),
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: const BoxDecoration(
                    shape:  BoxShape.circle,
                    color:  Color.fromARGB(255, 233, 38, 223)
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                    color:  Color.fromARGB(255, 54, 222, 85)
                  ),
                ),
              ),
             BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 100.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent), 
              ),
             ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if(state is WeatherBlocSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30), // Отступ слева для первого текста
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/mappin.and.ellipse.circle.svg', // Путь к вашему SVG файлу
                                  color: Colors.white,
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(width: 8),
                                 Text( 
                                  '${state.weather.areaName}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            )
                          ),
                          const SizedBox(height: 8),
                           Padding(
                            padding: const EdgeInsets.only(left: 30), // Отступ слева для второго текста
                            child: Text(
                                getGreetingMessage(state.weather.date!),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
													SizedBox(
                            height: 350, // Устанавливаем высоту в 450
                            child: getIconForWeatherMain(state.weather.weatherConditionCode!),
                          ),

                          
                           Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                             Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase() ,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                           Center(
                            child: Text(
                              DateFormat('EEEE dd .').add_jm().format(state.weather.date!),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Row(
                              children: [
                                      Image.asset(
                                      'assets/11.png',
                                      scale: 7,
                                    ),
                                    const SizedBox(width: 5),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sunrise',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunrise!),
                                          // '06:37 am',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                          ),
                                        )
                                      ],
                                    )
                    
                    
                              ],
                            ),
                    
                              Row(
                              children: [
                                      Image.asset(
                                      'assets/12.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sunset',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunset!),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                          ),
                                        )
                                      ],
                                    )
                    
                    
                    
                              ],
                            ),
                      
                    
                    
                            ],
                          ),
                              const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                    
                    
                    
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Row(
                              children: [
                                      Image.asset(
                                      'assets/13.png',
                                      scale: 7,
                                    ),
                                    const SizedBox(width: 5),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Tempt Max',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          '${state.weather.tempMax!.celsius!.round()} °C',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                          ),
                                        )
                                      ],
                                    )
                    
                    
                              ],
                            ),
                    
                              Row(
                              children: [
                                      Image.asset(
                                      'assets/14.png',
                                      scale: 11,
                                    ),
                                    const SizedBox(width: 5),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Temp Min',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                         '${state.weather.tempMin!.celsius!.round()} °C',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                          ),
                                        )
                                      ],
                                    )
                    
                    
                    
                              ],
                            ),
                      
                    
                    
                            ],
                          ),
                    
                    
                    
                        ],
                      ),
                    );
                    } else {
                      return Container();
                    }
                },
              )
            ],
           ),
        )
      ),
    );
  }
}