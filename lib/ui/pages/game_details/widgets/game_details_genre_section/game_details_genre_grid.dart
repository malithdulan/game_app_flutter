import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:game_app/helper/utils.dart';

import 'package:game_app/repositories/models/genre.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_genre_section/game_details_genre_item_section/game_details_genre_item.dart';

class GameDetailsGenreGrid extends StatelessWidget {
  final List<Genre>? data;
  const GameDetailsGenreGrid({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (data != null && data!.length > 2) ? Utils.shared.percentPH(40) : Utils.shared.percentPH(28.5),
      child: MasonryGridView.count(
        padding: EdgeInsets.all(Utils.shared.percentW(2)),
        // the number of columns
        crossAxisCount: 2,
        itemCount: data?.length,
        // vertical gap between two items
        mainAxisSpacing: Utils.shared.percentW(4),
        // horizontal gap between two items
        crossAxisSpacing: Utils.shared.percentW(4),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) => GameDetailsGenreItem(
          key: ValueKey("${data?[index].name}GameDetailsGenreItem"),
          data: data?[index],
        ),
      ),
    );
  }
}
