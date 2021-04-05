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
  int _monthlyIndex, _yearlyIndex;

  setSpref(String key, int value) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    spref.setInt(key, value);
  }

  _loadSPref(String key) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    int r = spref.getInt(key) ?? -1;
    setState(() {
      if(key == "monthly") _monthlyIndex = r;
      else if(key == "yearly") _yearlyIndex = r;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSPref("monthly");
    _loadSPref("yearly");
  }
  @override
  Widget build(BuildContext context) {
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
                    print(result['instance'].id);
                    setState(() {
                      _monthlyIndex = result['instance'].id - 1;
                      setSpref('monthly', _monthlyIndex);
                    });
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                          (_monthlyIndex == -1) ? "assets/horoscope/unknown.png" : zodiacs[_monthlyIndex].imagePath,
                          height: screenHeight * 0.09),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      (_monthlyIndex == -1) ? "Невыбрано" : zodiacs[_monthlyIndex].name,
                      style: TextStyle(
                          color: textPrimaryColor, fontWeight: FontWeight.w500, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  dynamic result = await Navigator.pushNamed(context, "/yearly");
                  if(result != null){
                    print(result['instance'].id);
                    setState(() {
                      _yearlyIndex = result['instance'].id - 1;
                      setSpref('yearly', _yearlyIndex);
                    });
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                          (_yearlyIndex == -1) ? "assets/horoscope/unknown.png" : yearZodiacs[_yearlyIndex].imagePath,
                          height: screenHeight * 0.09),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                        (_yearlyIndex == -1) ? "Невыбрано" : yearZodiacs[_yearlyIndex].name,
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
