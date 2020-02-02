import 'package:flutter/material.dart';
import 'package:trak/pages/loading_screen.dart';


//import 'package:device_simulator/device_simulator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[200]

        ),
//      home: DeviceSimulator(
//        brightness: Brightness.dark,
//        enable: false,
//        child: LoadingScreen() ,
//      ),


        home: LoadingScreen(),


    );
  }

}
