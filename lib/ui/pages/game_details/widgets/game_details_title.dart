import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';

import '../../../../repositories/models/result.dart';
import '../../../global_widgets/game_rating.dart';

class GameDetailsTitle extends StatelessWidget {
  final Result? data;
  const GameDetailsTitle({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 100,
      ),
      child: Card(
        margin: EdgeInsets.all(Utils.shared.percentW(3)),
        color: Colors.green,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(Utils.shared.percentW(3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data?.name ?? "Header title Header title",
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Text("Category"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GameRating(rating: data?.rating ?? 0.0),
                  const Text("4.2"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
