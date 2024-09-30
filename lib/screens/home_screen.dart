import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              SizedBox(
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
                            color: Colors.blue,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'New Zealand',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.only(left: 30), // Отступ слева для второго текста
                      child: Text(
                        'Good Morning',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/2.png'
                    ),
                    const Center(
                      child: Text(
                        '21°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                       const Center(
                      child: Text(
                        'THUNDERSTORM',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Center(
                      child: Text(
                        'Monday 30  -  04:13am',
                        style: TextStyle(
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
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sunrise',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '06:37 am',
                                    style: TextStyle(
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
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sunset',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '09:42 pm',
                                    style: TextStyle(
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
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tempt Max',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '32 °C',
                                    style: TextStyle(
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
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Temp Min',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '2 °C',
                                    style: TextStyle(
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
              )

            ],
           ),
        )
      ),
    );
  }
}