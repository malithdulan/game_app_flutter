import 'package:flutter/material.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:game_app/helper/constants.dart';
import 'package:game_app/ui/global_widgets/carousel_image.dart';

import '../../../../../helper/utils.dart';

import 'package:game_app/ui/pages/game_details/widgets/game_details_header_section/game_details_back_button.dart';

import '../../../../../repositories/models/short_screenshot.dart';

class GameDetailsHeader extends StatelessWidget {
  final List<ShortScreenshot>? images;

  const GameDetailsHeader({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utils.shared.percentPH(30),
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageSlideshow(
            autoPlayInterval: 3000,
            isLoop: true,
            indicatorBackgroundColor: Colors.white,
            indicatorColor: Colors.deepOrange,
            children: (images
                    ?.map(
                      (e) => CarouselImage(image: NetworkImage(e.image ?? "")),
                    )
                    .toList()) ??
                AssetImageUrls.gameSlider,
          ),
          const GameDetailsBackButton()
        ],
      ),
    );
  }
}
