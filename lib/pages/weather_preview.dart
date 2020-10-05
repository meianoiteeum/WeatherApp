import 'package:flutter/material.dart';
import 'package:flutter_app/controller/weather_api.dart';
import 'package:flutter_app/model/response.dart';

class WeatherPreview extends StatelessWidget {
  String _city;

  WeatherPreview(this._city);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(_city),
      ),
      body: _body(),
    );
  }

  _body() {
    Future<Body> body = WeatherApi.getWeathers(_city);

    return FutureBuilder(
      future: body,
      builder: (context, snapshot){
        return snapshot.hasData
            ? Container()
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
