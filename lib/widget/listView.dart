import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/controller/weather_api.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/pages/nav.dart';
import 'package:flutter_app/pages/weather_preview.dart';

class CitiesListView extends StatefulWidget {
  @override
  _CitiesListViewState createState() => _CitiesListViewState();
}

class _CitiesListViewState extends State<CitiesListView>{
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    List<String> cities = WeatherApi.cities;
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: cities.length,
          itemBuilder: (context, index) {
            String city = cities[index];
            return GestureDetector(
              child: Card(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Center(
                    child: Text(city),
                  ),
                ),
              ),
              onTap: () => push(context,WeatherPreview(city)),
            );
          }),
    );
  }
}
