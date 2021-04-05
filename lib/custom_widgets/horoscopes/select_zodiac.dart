import 'package:content_new/models/zodiac.dart';
import 'package:flutter/material.dart';


class SelectZodiacScreen extends StatefulWidget {
  @override
  _SelectZodiacScreenState createState() => _SelectZodiacScreenState();
}

class _SelectZodiacScreenState extends State<SelectZodiacScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Выберите зодиак")),
      body: ListView.builder(
        itemCount: zodiacs.length,
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
                title: Text(zodiacs[index].name),
                leading: Image.asset(zodiacs[index].imagePath),
              ),
            ),
          );
        },
      ),
    );
  }
}
