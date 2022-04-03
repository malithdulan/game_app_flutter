import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/game_details/widgets/title_section_widgets/game_details_title_widget.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_header_widget.dart';

import '../../../repositories/models/result.dart';

class GameDetailsLayout extends StatelessWidget {
  final Result? data;
  const GameDetailsLayout({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GameDetailsHeader(images: data?.shortScreenshots,),
          GameDetailsTitleTile(data: data,),
        ],
      ),
    );
  }
}
