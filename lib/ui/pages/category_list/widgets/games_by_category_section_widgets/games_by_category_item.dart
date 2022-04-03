import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:game_app/ui/pages/game_details/game_details_page.dart';

import '../../../../../helper/utils.dart';
import '../../../../../repositories/models/result.dart';
import 'games_by_category_title.dart';

class GamesByCategoryItem extends StatelessWidget {
  final Result? data;
  const GamesByCategoryItem({
    Key? key,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Utils.shared.percentW(3),
        vertical: Utils.shared.percentPH(1.5),
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, GameDetailsPage.name, arguments: data),
        child: CachedNetworkImage(
          imageUrl: data?.backgroundImage ?? "",
          imageBuilder: (context, imageProvider) => Stack(
            fit: StackFit.expand,
            children: [
              Utils.shared.gamesImageCard(image: imageProvider),
              Positioned(
                bottom: 0,
                child: GameByCategoryTitle(
                  name: data?.name ?? "",
                ),
              ),
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
      ),
    );
  }
}
