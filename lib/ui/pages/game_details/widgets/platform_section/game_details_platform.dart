import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';

import 'package:game_app/repositories/models/platform_element.dart';
import 'package:game_app/ui/global_widgets/common_list_layout_card.dart';
import 'package:game_app/ui/pages/game_details/widgets/platform_section/game_details_platfom_grid.dart';

class GameDetailsPlatform extends StatelessWidget {
  final List<PlatformElement>? data;
  const GameDetailsPlatform({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonListLayoutCard(
      children: [
        Text(
          "Platforms",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Utils.shared.fScale(17),
          ),
        ),
        GameDetailsPlatformGrid(
          data: data,
        ),
      ],
    );
  }
}
