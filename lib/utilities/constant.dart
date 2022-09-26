import 'package:flutter/material.dart';
const kTextFieldInputDecoration= InputDecoration(
  icon: Icon(Icons.location_city,color: Colors.white,),
  prefixIcon: Icon(
    Icons.search,
    color: Colors.white,
  ),
  hintText: 'Enter City name',
  hintStyle: TextStyle(color: Colors.white),
  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0),),
    borderSide:BorderSide.none,
  ),
);