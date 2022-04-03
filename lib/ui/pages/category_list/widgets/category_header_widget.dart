import 'package:flutter/material.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:game_app/helper/utils.dart';

class CategoryHeaderWidget extends StatelessWidget {
  const CategoryHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ImageSlideshow(
        autoPlayInterval: 3000,
        isLoop: true,
        indicatorBackgroundColor: Colors.white,
        indicatorColor: Colors.deepOrange,
        children: [
          Utils.shared.sliderImage(const AssetImage('assets/images/bf2048.jpg')),
          Utils.shared.sliderImage(const AssetImage('assets/images/bf2048.jpg')),
          Utils.shared.sliderImage(const AssetImage('assets/images/c2.jpg')),
          Utils.shared.sliderImage(const AssetImage('assets/images/cd1.jpg')),
          Utils.shared.sliderImage(const AssetImage('assets/images/gd.jpg')),
      ],
      ),
    );
  }
}
