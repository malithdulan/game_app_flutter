import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:game_app/ui/global_widgets/error_item.dart';
import '../../../../../helper/constants.dart';

import '../../../../global_widgets/carousel_image.dart';
import '../../../../global_widgets/loading_item.dart';

class GameDetailsHeaderImage extends StatelessWidget {
  final String? imageUrl;
  const GameDetailsHeaderImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? Constants.defaultUrl,
      imageBuilder: (context, imageProvider) => CarouselImage(image: imageProvider),
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: LoadingItem(),
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: ErrorItem(),
      ),
    );
  }
}
