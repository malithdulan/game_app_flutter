import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../helper/constants.dart';
import 'package:game_app/helper/utils.dart';

import 'package:game_app/ui/global_widgets/error_item.dart';
import 'package:game_app/ui/global_widgets/image_card.dart';
import 'package:game_app/ui/global_widgets/loading_item.dart';
import '../../../../global_widgets/card_bottom_title.dart';

import 'package:game_app/repositories/models/platform_element.dart';

class GameDetailsPlatformItem extends StatelessWidget {
  final PlatformElement? data;
  const GameDetailsPlatformItem({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Utils.shared.percentW(2)),
      width: Utils.shared.percentW(50),
      child: CachedNetworkImage(
        imageUrl: data?.platform?.imageBackground ?? Constants.defaultUrl,
        imageBuilder: (context, imageProvider) => Stack(
          fit: StackFit.expand,
          children: [
            ImageCard(
              image: imageProvider,
              radius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            Positioned(
              bottom: 0,
              child: CardBottomTitle(
                name: data?.platform?.name ?? "",
                width: Utils.shared.percentW(50),
              ),
            )
          ],
        ),
        placeholder: (context, url) => const ImageCard(
          child: Center(
            child: LoadingItem(),
          ),
        ),
        errorWidget: (context, url, error) => const ImageCard(
          child: ErrorItem(),
        ),
      ),
    );
  }
}
