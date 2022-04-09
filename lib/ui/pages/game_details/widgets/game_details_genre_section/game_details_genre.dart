import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';

import 'package:game_app/repositories/models/genre.dart';

import 'package:game_app/ui/global_widgets/common_list_layout_card.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_genre_section/game_details_genre_grid.dart';

class GameDetailsGenre extends StatelessWidget {
  final List<Genre>? data;
  const GameDetailsGenre({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonListLayoutCard(
      isLastItem: true, //if this is last element, increase padding bottom
      children: [
        Text(
          "Genres",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Utils.shared.fScale(17),
          ),
        ),
        GameDetailsGenreGrid(data: data),
      ],
    );
  }
}
