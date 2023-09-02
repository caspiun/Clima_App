import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override

  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel=WeatherModel();
  int ?tempra;
  double ?temp;
  String ?city;
  String ?weathericon;
  String ?tempmsg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateUI(widget.locationweather);

  }
  void updateUI(dynamic weatherdata )
  {
    setState(() {
      if(weatherdata==null)
        {
          tempra=0;
          weathericon='Error';
          tempmsg='unable to get weather data';
          city='';
          return;
        }
      temp=weatherdata['main']['temp'];
      tempra=temp!.toInt();
      city=weatherdata['name'];
      var condition=weatherdata['weather'][0]['id'];
      weathericon=weatherModel.getWeatherIcon(condition);
      tempmsg=weatherModel.getMessage(tempra!);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherdata= await weatherModel.getlocationweather();
                      updateUI(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: (

                        ) {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$tempra',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weathericon!,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$tempmsg in $city",

                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}