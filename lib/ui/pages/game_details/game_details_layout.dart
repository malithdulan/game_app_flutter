import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_title.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_header.dart';

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
          GameDetailsTitle(data: data,),
        ],
      ),
    );
  }
}
