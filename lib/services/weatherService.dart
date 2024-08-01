// help to fetch data::

import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  static const base_url = "https://api.openweathermap.org/data/2.5/weather";
  String apiKey = '67d7189dc893c26d136d0c93f8ecfb5b';

  Future<Weather> getWeather(String city) async{
    final response = await http.get(Uri.parse('${base_url}?q=${city}&appid=${apiKey}'));

    try{
      if(response.statusCode == 200)
      {
        return Weather.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception("failed to load weather");
      }
    }catch(e){
      print("ERROR: $e");
    }
    return getWeather(city);
  }

  // get device location:::
  Future<String> getLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);

    // convert the location into latitude, longitude
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);

    // city name
    String? city = placemark[0].toString();

    return city ?? "";
  }
}