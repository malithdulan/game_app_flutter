import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/global_widgets/game_rating.dart';
import 'package:game_app/ui/pages/game_list/widgets/game_list_item_image.dart';

import '../../../../repositories/models/result.dart';
import '../../game_details/game_details_page.dart';

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
        onTap: () => Navigator.of(context).pushNamed(GameDetailsPage.name, arguments: data),
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
                padding:
                    EdgeInsets.symmetric(horizontal: Utils.shared.percentW(2)),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      data?.name ?? "",
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Row(
                      children: [
                        GameRating(rating: data?.rating ?? 0.0),
                        Padding(
                          padding: EdgeInsets.only(left: Utils.shared.percentW(2)),
                          child: Text(
                            (data?.rating ?? 0.0).toString(),
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
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
