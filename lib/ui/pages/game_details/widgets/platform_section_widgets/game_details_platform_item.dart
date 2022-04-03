import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:game_app/helper/utils.dart';
import 'package:game_app/repositories/models/platform_element.dart';

class GameDetailsPlatformItem extends StatelessWidget {
  final PlatformElement? data;
  const GameDetailsPlatformItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Utils.shared.percentW(2)),
      width: Utils.shared.percentW(50),
      child: CachedNetworkImage(
        imageUrl: data?.platform?.imageBackground ?? "",
        imageBuilder: (context, imageProvider) => Stack(
          fit: StackFit.expand,
          children: [
            Utils.shared.gamesImageCard(image: imageProvider),
          ],
        ),
        placeholder: (context, url) => Utils.shared.gamesImageCard(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Utils.shared.gamesImageCard(
          child: const Icon(
            Icons.error,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
