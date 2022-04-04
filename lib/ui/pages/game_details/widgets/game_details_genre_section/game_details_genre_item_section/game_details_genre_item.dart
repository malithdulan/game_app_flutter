import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';

import 'package:game_app/ui/pages/game_details/widgets/game_details_genre_section/game_details_genre_item_section/game_details_genre_item_image.dart';

import '../../../../../../repositories/models/genre.dart';

class GameDetailsGenreItem extends StatelessWidget {
  final Genre? data;
  const GameDetailsGenreItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: GameDetailsGenreItemImage(imageUrl: data?.imageBackground),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(Utils.shared.percentW(2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.name ?? "",
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                Text("Games: ${data?.gamesCount ?? ""}")
              ],
            ),
          )
        ],
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 2),
        ],
      ),
    );
  }
}
