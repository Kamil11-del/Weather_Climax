import 'package:flutter/material.dart';
import 'package:weather_app1/utilities/constant.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);
  @override
  State<CityScreen> createState() => _CityScreenState();
}
class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/weather.jpg'),
          fit: BoxFit.fill,
        )),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back_ios,size: 50,color: Colors.white,),)),
              Opacity(
                opacity: 0.7,
                child: Container(
                  margin: EdgeInsets.only(top: 80.0),
                  width: 300,
                  color: Color(0xFF032848),
                  child: TextField(
                    onChanged: (value){
                      cityName=value;
                    },
                    decoration:kTextFieldInputDecoration,
                    cursorColor: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context,cityName);
                    },
                    child: Text(
                      'Get Location',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color:Color(0xFF032848),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
