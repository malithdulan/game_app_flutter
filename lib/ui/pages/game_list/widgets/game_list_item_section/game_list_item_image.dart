import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../helper/constants.dart';

import 'package:game_app/ui/global_widgets/error_item.dart';
import 'package:game_app/ui/global_widgets/image_card.dart';
import 'package:game_app/ui/global_widgets/loading_item.dart';

class GameListItemImage extends StatelessWidget {
  final String? imageUrl;
  const GameListItemImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? Constants.defaultUrl,
      imageBuilder: (context, imageProvider) => ImageCard(
        image: imageProvider,
        radius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        shadow: false,
      ),
      placeholder: (context, url) => const ImageCard(
        child: Center(
          child: SizedBox(
            width: 25,
            height: 25,
            child: LoadingItem(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const ImageCard(
        child: ErrorItem(),
      ),
    );
  }
}
