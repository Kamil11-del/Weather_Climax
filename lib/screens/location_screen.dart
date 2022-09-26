import 'package:flutter/material.dart';
import 'package:weather_app1/screens/city_screen.dart';
import 'package:weather_app1/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather, Key? key}) : super(key: key);
  var locationWeather;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? cityName;
  String? weatherMessage;
  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  updateUi(dynamic locWeather) {
    setState(() {
      if (locWeather == null) {
         temperature = 0;
         weatherIcon = 'Error';
         weatherMessage = 'Unable to get Weather Data';
         cityName = '';
        return;
      }
        double temp = locWeather['main']['temp'];
         temperature = temp.toInt();
        var condition = locWeather['weather'][0]['id'];
        weatherIcon = weatherModel.getWeatherIcon(condition);
        weatherMessage = weatherModel.getWeatherMessage(temperature!);
         cityName = locWeather['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/download.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () async{
                      var weatherData= await weatherModel.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  FlatButton(
                      onPressed: () async{
                       var typedName=await Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen(),),);
                       if(typedName!=null){
                        var weatherData=await weatherModel.getCityWeather(typedName);
                        updateUi(weatherData);
                       }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: Colors.white,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0,left: 20.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 30.0,),
                    Text(
                      '$weatherIcon',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '$weatherMessage in $cityName',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
