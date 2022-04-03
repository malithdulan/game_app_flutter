import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:game_app/helper/utils.dart';

class GameListItemImage extends StatelessWidget {
  final String? imageUrl;
  const GameListItemImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "",
      imageBuilder: (context, imageProvider) => Utils.shared.gameListImageCard(image: imageProvider),
      placeholder: (context, url) => Utils.shared.gameListImageCard(
        child: const Center(
          child: SizedBox(width: 25, height: 25, child: CircularProgressIndicator()),
        ),
      ),
      errorWidget: (context, url, error) => Utils.shared.gameListImageCard(
        child: const Icon(
          Icons.error,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}
