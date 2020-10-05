import 'dart:convert';

import 'package:flutter_app/model/response.dart';
import 'package:http/http.dart' as http;

class Cities{
  static final String SILVERSTONE = "Silverstone,uk";
  static final String SAOPAULO = "São Paulo,br";
  static final String MELBOURNE = "Melbourne,au";
  static final String MONTECARLO = "Monte-Carlo,mc";
}

class WeatherApi{
  static String _APIID = "c8358c60ad214af3a2abcd4ea803a09f";

  static List<String> cities =[Cities.SILVERSTONE, Cities.SAOPAULO, Cities.MELBOURNE, Cities.MONTECARLO];

  static Future<Body> getWeathers(String tipo) async{
    var URL = "https://api.openweathermap.org/data/2.5/weather?q=${tipo}&APPID=${_APIID}";

    var response = await http.get(URL);

    Body body = Body.fromJson(json.decode(response.body));

    return body;
  }
}