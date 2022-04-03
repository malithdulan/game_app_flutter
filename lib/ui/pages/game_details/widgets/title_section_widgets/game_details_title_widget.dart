import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_card_widget.dart';
import 'package:game_app/ui/pages/game_details/widgets/title_section_widgets/game_details_date_tile.dart';
import 'package:game_app/ui/pages/game_details/widgets/title_section_widgets/game_details_genres_tile.dart';

import '../../../../../repositories/models/result.dart';
import '../../../../global_widgets/game_rating.dart';

class GameDetailsTitleTile extends StatelessWidget {
  final Result? data;
  const GameDetailsTitleTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameDetailsCardWidget(
      children: [
        Text(
          data?.name ?? "Header title Header title",
          style: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Utils.shared.percentPH(2),
            bottom: Utils.shared.percentPH(2),
          ),
          child: GameDetailsGenresTile(data: data?.genres),
        ),
        (data?.released != null)
            ? Padding(
                padding: EdgeInsets.only(
                  bottom: Utils.shared.percentW(2),
                ),
                child: GameDetailsDateTile(date: data?.released),
              )
            : const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GameRating(rating: data?.rating ?? 0.0),
            const Text(
              "4.2",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        )
      ],
    );
  }
}
