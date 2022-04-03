import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/pages/category_list/widgets/games_by_category_section_widgets/games_by_category_grid.dart';

import '../../../../../repositories/models/result.dart';

class GamesByCategorySuccessWidget extends StatelessWidget {
  final String? categoryName;
  final List<Result>? games;

  const GamesByCategorySuccessWidget(
      {Key? key, required this.games, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utils.shared.percentPH(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: Utils.shared.percentW(3)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  categoryName ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: Utils.shared.percentPH(20),
            child: GamesByCategoryGrid(games: games),
          ),
        ],
      ),
    );
  }
}
