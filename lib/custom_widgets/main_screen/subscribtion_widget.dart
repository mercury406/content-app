import 'package:flutter/material.dart';

import '../../constants.dart';

class SubscribtionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: screenHeight * 0.45,
        width: screenWidth,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  "Ваши подписки на сегодня",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: textPrimaryColor, fontSize: 22),
                )
            ),
          ],
        ),
      ),
    );
  }
}
