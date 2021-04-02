import 'package:content_new/main.dart';
import 'package:content_new/models/zodiac.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SelectZodiacScreen extends StatefulWidget {
  @override
  _SelectZodiacScreenState createState() => _SelectZodiacScreenState();
}

class _SelectZodiacScreenState extends State<SelectZodiacScreen> {

  Future<void> setSPref(int index) async{
    SharedPreferences.setMockInitialValues({});
    final spref = await SharedPreferences.getInstance();
    spref.setInt("monthly", index);
  }

  @override
  void initState() async {
    super.initState();
    // final spref = await SharedPreferences.getInstance();
    // int index = spref.getInt('monthly');
    // if(index == null){
    //   Navigator.pushReplacementNamed(context, "/", arguments: {
    //     'id': zodiacs[0].id,
    //     'title': zodiacs[0].name,
    //     'imgPath': zodiacs[0].imagePath,
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Выберите зодиак")),
      body: ListView.builder(
        itemCount: zodiacs.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setSPref(zodiacs[index].id);
              Zodiac instance = zodiacs[index];
              Navigator.pop(context, {
                "id":  instance.id,
                "name": instance.name,
                "imagePath": instance.imagePath,
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
