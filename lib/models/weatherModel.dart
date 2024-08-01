class Weather{

  final city;
  final temp;
  final mainCondition;

  Weather({
    required this.city,
    required this.temp,
    required this.mainCondition,
});

  // factory - Factory constructors in Dart are flexible alternatives to generative constructors.
  // Unlike generative constructors that always return a new instance
  factory Weather.fromJson(Map<String, dynamic> json)
  {
    return Weather(
        city: json["name"],
        temp: json["main"]["temp"].toDouble,
        mainCondition: json["weather"][0]["main"],
    );
  }
}