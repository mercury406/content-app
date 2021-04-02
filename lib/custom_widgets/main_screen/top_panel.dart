import 'package:content_new/models/zodiac.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class TopPanelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        color: Colors.grey[400],
      ),
      height: screenHeight * 0.35,
      width: screenWidth,
      child: Column(
        children: [
          TopContainer(),
        ],
      ),
    );
  }
}

class TopContainer extends StatefulWidget {
  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  Map monthlyData = {};

  Future<void> setSPref(int index) async{
    // SharedPreferences.setMockInitialValues({});
    var spref = await SharedPreferences.getInstance();
    spref.setInt("monthly", index);
  }

  @override
  Widget build(BuildContext context) {

    monthlyData = (monthlyData != null && monthlyData.isNotEmpty) ? monthlyData : ModalRoute.of(context).settings.arguments;
    print(monthlyData);

    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 48, left: 32, right: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("C возвращением, ОЛДЖ",
            style: TextStyle(
                color: textPrimaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: 1
            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(),
              InkWell(
                onTap: () {
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: ClipRRect(
                        child: Image.asset("assets/flag-uzbekistan.jpg", height: screenHeight * 0.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          "Tashkent",
                          style: TextStyle(
                              color: textPrimaryColor, fontWeight: FontWeight.w500, fontSize: 18.0),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  dynamic result = await Navigator.pushNamed(context, "/monthly");
                  if(result != null){
                    setState(() {
                      monthlyData = {
                        'id': result["id"],
                        'title': result["title"],
                        'imagePath': result['imagePath']
                      };
                      setSPref(result['id']);
                    });
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Image.asset(monthlyData['imgPath'], height: screenHeight * 0.09),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text( monthlyData['title'],
                      style: TextStyle(
                          color: textPrimaryColor, fontWeight: FontWeight.w500, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/yearly");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Image.asset(year_zodiacs[0].imagePath, height: screenHeight * 0.09),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      year_zodiacs[0].name,
                      style: TextStyle(
                          color: textPrimaryColor, fontWeight: FontWeight.w500, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              Container()
            ],
          ),
        ],
      ),
    );
  }
}
