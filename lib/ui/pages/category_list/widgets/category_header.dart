import 'package:flutter/material.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:game_app/helper/constants.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ImageSlideshow(
        autoPlayInterval: 3000,
        isLoop: true,
        indicatorBackgroundColor: Colors.white,
        indicatorColor: Colors.deepOrange,
        children: AssetImageUrls.categorySlider,
      ),
    );
  }
}
