import 'package:flutter/material.dart';
import 'package:game_app/repositories/models/platform_element.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_card_widget.dart';
import 'package:game_app/ui/pages/game_details/widgets/platform_section_widgets/game_details_platfom_grid.dart';

class GameDetailsPlatformWidget extends StatelessWidget {
  final List<PlatformElement>? data;
  const GameDetailsPlatformWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameDetailsCardWidget(
      marginTop: false,
      children: [
        const Text(
          "Platforms",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        GameDetailsPlatformGrid(data: data,),
      ],
    );
  }
}
