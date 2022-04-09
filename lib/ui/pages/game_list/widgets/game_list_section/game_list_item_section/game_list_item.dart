import 'package:flutter/material.dart';

import 'package:game_app/helper/utils.dart';

import 'package:game_app/ui/global_widgets/game_item_rating.dart';

import '../../../../../../repositories/models/result.dart';
import '../../../../game_details/game_details_page.dart';
import 'game_list_item_image.dart';

class GameListItem extends StatelessWidget {
  final Result? data;
  const GameListItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Utils.shared.percentW(5),
        vertical: Utils.shared.percentPH(1),
      ),
      width: double.infinity,
      height: Utils.shared.percentPH(12),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(GameDetailsPage.name, arguments: data),
        child: Row(
          children: [
            SizedBox(
              width: Utils.shared.percentPH(12),
              child: GameListItemImage(
                imageUrl: data?.backgroundImage,
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                padding:
                    EdgeInsets.symmetric(horizontal: Utils.shared.percentW(2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      data?.name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: Utils.shared.fScale(16),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data?.genres?.first.name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Utils.shared.fScale(14),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GameItemRating(data: data),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 2),
        ],
      ),
    );
  }
}
