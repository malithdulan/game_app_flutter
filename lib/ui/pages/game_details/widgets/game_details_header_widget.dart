import 'package:flutter/material.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../helper/utils.dart';
import '../../../../repositories/models/short_screenshot.dart';
import '../../../global_widgets/glass_morphism.dart';

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
                      (e) => Utils.shared.sliderImage(
                        NetworkImage(e.image ?? ""),
                      ),
                    )
                    .toList()) ??
                [
                  Utils.shared.sliderImage(
                      const AssetImage('assets/images/farcry5.jpg')),
                  Utils.shared.sliderImage(
                      const AssetImage('assets/images/farcry3.jpg')),
                ],
          ),
          Positioned(
            left: Utils.shared.percentW(5),
            top: Utils.shared.percentPH(8),
            child: GlassMorphism(
              width: Utils.shared.percentW(13),
              height: Utils.shared.percentW(13),
              blur: 20,
              opacity: 0.2,
              radius: (Utils.shared.percentW(13) / 2),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
