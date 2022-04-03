import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:game_app/ui/global_widgets/card_bottom_title.dart';

import '../../../../../../helper/constants.dart';
import '../../../../../../helper/utils.dart';

import 'package:game_app/ui/global_widgets/error_item.dart';
import 'package:game_app/ui/global_widgets/image_card.dart';
import 'package:game_app/ui/global_widgets/loading_item.dart';
import 'package:game_app/ui/pages/game_details/game_details_page.dart';

import '../../../../../../repositories/models/result.dart';

class GamesByCategoryItem extends StatelessWidget {
  final Result? data;
  const GamesByCategoryItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Utils.shared.percentW(3),
        vertical: Utils.shared.percentPH(1.5),
      ),
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, GameDetailsPage.name, arguments: data),
        child: CachedNetworkImage(
          imageUrl: data?.backgroundImage ?? Constants.defaultUrl,
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
                  name: data?.name ?? "",
                  width: Utils.shared.percentW(44),
                ),
              ),
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
      ),
    );
  }
}
