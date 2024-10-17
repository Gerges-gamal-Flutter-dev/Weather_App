class WeatherModel {
  final String cityName;
  final String date;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String weatherStateName;
  final String icon;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.avgTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStateName,
      required this.icon});

  factory WeatherModel.fromJson(json, int index) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['forecast']['forecastday'][index]['date'],
      avgTemp: json['forecast']['forecastday'][index]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][index]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][index]['day']['maxtemp_c'],
      weatherStateName: json['forecast']['forecastday'][index]['day']
          ['condition']['text'],
      icon: json['forecast']['forecastday'][index]['day']['condition']['icon'],
    );
  }
}
