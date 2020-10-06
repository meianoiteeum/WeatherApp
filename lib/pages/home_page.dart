import 'package:flutter/material.dart';
import 'package:flutter_app/model/response.dart';
import 'package:flutter_app/widget/listView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Weather App"),
      ),
      body: CitiesListView(null)
    );
  }
}
