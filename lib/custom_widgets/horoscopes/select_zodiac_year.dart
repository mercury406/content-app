import 'package:content_new/models/zodiac.dart';
import 'package:flutter/material.dart';

class SelectZodiacYearScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Выберите зодиак")),
      body: ListView.builder(
        itemCount: year_zodiacs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Image.asset(year_zodiacs[index].imagePath, height: screenWidth * 0.4,),
              title: Text(year_zodiacs[index].name),
            ),
          );
        },
      ),
    );
  }
}
