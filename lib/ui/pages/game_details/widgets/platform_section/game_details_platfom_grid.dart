import 'package:flutter/material.dart';

import 'package:game_app/helper/utils.dart';

import 'package:game_app/ui/pages/game_details/widgets/platform_section/game_details_platform_item.dart';

import 'package:game_app/repositories/models/platform_element.dart';

class GameDetailsPlatformGrid extends StatelessWidget {
  final List<PlatformElement>? data;
  const GameDetailsPlatformGrid({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utils.shared.percentPH(20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GameDetailsPlatformItem(
          key: ValueKey(
              "${data?[index].platform?.name}${index}GameDetailsPlatform"),
          data: data?[index],
        ),
        itemCount: data?.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
