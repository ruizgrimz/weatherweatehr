import 'package:http/http.dart';
import 'package:test_clima_flutter/services/location.dart';
import 'dart:convert';

class Networking{
  String appID = "c78c9086de5a9c3ac2bd8b278f8290e5";
  double temp=0;
  String data='', city='';
  int id=0;

  Future<String> getData() async{

    Location location  = new Location();
    await location.getLocation();
    double lat = location.lat;
    double lon = location.lon;

    Uri url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appID&units=metric");
    Response response = await get(url);
    data = response.body;
    if (response.statusCode == 200){
      return data;
    }else{
      return "error";
    }

  }

}