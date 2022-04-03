import 'package:flutter/material.dart';
import 'package:game_app/repositories/models/result.dart';
import 'package:game_app/repositories/models/short_screenshot.dart';
import 'package:game_app/ui/pages/game_details/game_details_layout.dart';

class GameDetailsPage extends StatelessWidget {
  static const String name = "/gameDetailsPage";

  const GameDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: GameDetailsLayout(data: ModalRoute.of(context)?.settings.arguments as Result?),
      ),
    );
  }
}
