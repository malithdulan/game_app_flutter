import 'package:flutter/material.dart';

import 'package:game_app/repositories/models/platform_element.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_card.dart';
import 'package:game_app/ui/pages/game_details/widgets/platform_section/game_details_platfom_grid.dart';

class GameDetailsPlatform extends StatelessWidget {
  final List<PlatformElement>? data;
  const GameDetailsPlatform({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameDetailsCard(
      children: [
        const Text(
          "Platforms",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        GameDetailsPlatformGrid(data: data,),
      ],
    );
  }
}
