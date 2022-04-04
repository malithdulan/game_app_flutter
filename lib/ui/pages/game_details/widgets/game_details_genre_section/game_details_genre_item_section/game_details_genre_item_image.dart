import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../../helper/constants.dart';

import '../../../../../global_widgets/error_item.dart';
import '../../../../../global_widgets/image_card.dart';
import '../../../../../global_widgets/loading_item.dart';

class GameDetailsGenreItemImage extends StatelessWidget {
  final String? imageUrl;
  const GameDetailsGenreItemImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? Constants.defaultUrl,
      imageBuilder: (context, imageProvider) => ImageCard(
        image: imageProvider,
        radius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
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
