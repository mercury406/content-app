import 'package:content_new/custom_widgets/horoscopes/select_zodiac_year.dart';
import 'package:content_new/custom_widgets/main_screen/top_panel.dart';
import 'package:content_new/custom_widgets/weather/weather_main.dart';
import 'package:flutter/material.dart';
import 'custom_widgets/entertainment/entertainment_main.dart';
import 'custom_widgets/horoscopes/horoscope_main.dart';
import 'custom_widgets/horoscopes/select_zodiac.dart';
import 'custom_widgets/main_screen/ServicesCategoryWidget.dart';
import 'custom_widgets/main_screen/subscribtion_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => HomePage(),
        '/monthly': (context) => SelectZodiacScreen(),
        '/yearly': (context) => SelectZodiacYearScreen(),
        '/weather': (context) => WeatherScreen(),
        '/entertainment': (context) => EntertainmentScreen(),
        '/horoscopes': (context) => HoroscopeScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopPanelWidget(),
            ServiceCategoryWidget(),
            SubscribtionsWidget(),
          ],
        ),
      ),
    );
  }
}