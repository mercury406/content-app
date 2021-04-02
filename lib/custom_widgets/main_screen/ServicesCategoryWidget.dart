import 'package:flutter/material.dart';

import 'category_card.dart';

class ServiceCategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryCard(
              image: "cloudy.png",
              text: "Погода",
              screenClass: '/weather'
          ),
          CategoryCard(
              image: "dancing.png",
              text: "Развлечения",
              screenClass: '/entertainment'
          ),
          CategoryCard(
              image: "horoscope.png",
              text: "Гороскопы",
              screenClass: '/horoscopes'
          ),
        ],
      ),
    );
  }
}

