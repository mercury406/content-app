import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Погода"),),
      body: Center(
        child: Text("Погода"),
      ),
    );
  }
}
