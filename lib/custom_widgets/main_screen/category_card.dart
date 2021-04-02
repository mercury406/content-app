import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image, text, screenClass;
  // final Widget screenClass;

  CategoryCard({this.image, this.text, this.screenClass});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    void navigateRoute(){
      Navigator.pushNamed(context, screenClass);
    }
    
    return InkWell(
      onTap: (){
        navigateRoute();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset("assets/${image}", width: screenWidth * 0.3),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w900, letterSpacing: 1),
            )
          ],
        ),
      ),
    );
  }
}
