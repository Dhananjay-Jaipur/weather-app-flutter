import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weatherModel.dart';
import 'package:weather/services/weatherService.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  late WeatherService _weatherService;
  Weather? _weather;

  _fetchWeather() async{
    String city = await _weatherService.getLocation();

    try{
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
      });
    }

    catch(e) {
      print(e);
    }
  }


  // call func:::
  void initState(){
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
                child: Lottie.asset("assets/cloud.json")
            ),

            SizedBox(height: 33,),

            Text(_weather?.city.toString() ?? "loading city..."),

            Text("${_weather?.temp.round()}℃")
          ],
        ),
      ),
    );
  }
}
