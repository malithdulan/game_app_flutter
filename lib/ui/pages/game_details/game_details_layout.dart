import 'package:flutter/material.dart';

import 'package:game_app/ui/pages/game_details/widgets/game_details_genre_section/game_details_genre.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_back_button.dart';
import 'package:game_app/ui/pages/game_details/widgets/platform_section/game_details_platform.dart';
import 'package:game_app/ui/pages/game_details/widgets/title_section/game_details_title.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_header_section/game_details_header.dart';

import '../../../repositories/models/result.dart';

class GameDetailsLayout extends StatelessWidget {
  final Result? data;
  const GameDetailsLayout({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GameDetailsHeader(images: data?.shortScreenshots,),
              GameDetailsTitle(data: data,),
              GameDetailsPlatform(data: data?.platforms,),
              GameDetailsGenre(data: data?.genres),
            ],
          ),
        ),
        const GameDetailsBackButton(),
      ],
    );
  }
}
