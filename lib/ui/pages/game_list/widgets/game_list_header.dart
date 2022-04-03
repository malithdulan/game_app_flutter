import 'package:flutter/material.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/global_widgets/glass_morphism.dart';
import 'package:game_app/ui/pages/game_list/widgets/game_list_search_button.dart';

class GameListHeader extends StatelessWidget {
  const GameListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Utils.shared.percentPH(30),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageSlideshow(
            autoPlayInterval: 3000,
            isLoop: true,
            indicatorBackgroundColor: Colors.white,
            indicatorColor: Colors.deepOrange,
            children: [
              Utils.shared.sliderImage(const AssetImage('assets/images/farcry2.jpg')),
              Utils.shared.sliderImage(const AssetImage('assets/images/farcry3.jpg')),
              Utils.shared.sliderImage(const AssetImage('assets/images/farcry4.jpg')),
              Utils.shared.sliderImage(const AssetImage('assets/images/farcry5.jpg')),

            ],
          ),
          Positioned(
            right: Utils.shared.percentW(5),
            top: Utils.shared.percentPH(8),
            child: GlassMorphism(
              width: Utils.shared.percentW(13),
              height: Utils.shared.percentW(13),
              blur: 20,
              opacity: 0.2,
              radius: (Utils.shared.percentW(13)/ 2),
              child: const GameListSearchButton(),
            ),
          ),
        ],
      ),
    );
  }
}



