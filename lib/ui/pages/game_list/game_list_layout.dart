import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/game_list/widgets/game_list_header.dart';
import 'package:game_app/ui/pages/game_list/widgets/game_list_widget.dart';

class GameListLayout extends StatelessWidget {
  const GameListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        GameListHeader(),
        GameListWidget(),
      ],
    );
  }
}
