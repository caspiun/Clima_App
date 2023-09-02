

import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import '../services/location.dart';
import 'location_screen.dart';
Location location=Location();
double ?latitude;
double ?longitude;

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState()
  {
    super.initState();
   getlocationdata();
  }


  void getlocationdata ()async
  {

WeatherModel weatherModel=WeatherModel();
var weatherdata=weatherModel.getlocationweather();

Navigator.push(context, MaterialPageRoute(builder: (context)
   {
     return LocationScreen(locationweather: weatherdata);
   }));

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: SpinKitDoubleBounce(
          size: 100,color: Colors.black,
        ),
      ),

    );
  }
}





