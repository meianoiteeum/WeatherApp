import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/controller/weather_api.dart';
import 'package:flutter_app/model/response.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/pages/nav.dart';
import 'package:flutter_app/pages/weather_preview.dart';

class CitiesListView extends StatefulWidget {
  Body _cities;

  CitiesListView(this._cities);

  @override
  _CitiesListViewState createState() => _CitiesListViewState();
}

class _CitiesListViewState extends State<CitiesListView>{
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    List<String> cities;
    if(widget._cities == null)
     cities = WeatherApi.cities;

    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: widget._cities == null ? cities.length : widget._cities.weather.length,
          itemBuilder: (context, index) {
            if(widget._cities == null) {
              String city = cities[index];
              return _gesture(city);
            }
            return _listBodies(widget._cities, index);
          }),
    );

  }

  Widget _listBodies(Body cities, int index){
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Text(
              "Main: ${cities.weather[index].main}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Description: ${cities.weather[index].description}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Wind: ${cities.wind.speed}",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  Widget _gesture(String city) {
    return GestureDetector(
      child: Card(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: [
              Text(
                city,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      onTap: () => push(context,WeatherPreview(city)),
    );
  }
}
