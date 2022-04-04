import 'package:flutter/material.dart';

import '../../../../../../helper/utils.dart';

import 'game_rating.dart';

import '../../../../../../repositories/models/result.dart';

class GameItemRating extends StatelessWidget {
  final Result? data;
  const GameItemRating({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GameRating(rating: data?.rating ?? 0.0),
        Padding(
          padding: EdgeInsets.only(left: Utils.shared.percentW(2)),
          child: Text(
            "${data?.rating} / 5",
            style: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}