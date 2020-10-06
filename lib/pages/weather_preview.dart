import 'package:flutter/material.dart';
import 'package:flutter_app/controller/weather_api.dart';
import 'package:flutter_app/model/response.dart';
import 'package:flutter_app/widget/listView.dart';

class WeatherPreview extends StatefulWidget {
  String _city;

  WeatherPreview(this._city);

  @override
  _WeatherPreviewState createState() => _WeatherPreviewState();
}

class _WeatherPreviewState extends State<WeatherPreview> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(widget._city),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Current",
              ),
              Tab(
                text: "5 days later",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Current(),
            Container(),
          ],
        ),
      ),
    );
  }

  Current() {
    Future<Body> body = WeatherApi.getWeathers(widget._city);
    return FutureBuilder(
      future: body,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? CitiesListView(snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
