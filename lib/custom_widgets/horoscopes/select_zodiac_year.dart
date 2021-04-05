import 'package:content_new/models/zodiac.dart';
import 'package:flutter/material.dart';

class SelectZodiacYearScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Выберите зодиак")),
      body: ListView.builder(
        itemCount: yearZodiacs.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Zodiac instance = zodiacs[index];
              Navigator.pop(context, {
                "instance": instance
              });
            },
            child: Card(
              child: ListTile(
                  leading: Image.asset(yearZodiacs[index].imagePath, height: screenWidth * 0.4,),
                  title: Text(yearZodiacs[index].name)
              ),
            ),
          );
        },
      ),
    );
  }
}
