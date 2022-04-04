import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_app/ui/pages/game_details/blocs/game_details_back_button_bloc/game_details_back_button_bloc.dart';

import 'package:game_app/ui/pages/game_details/widgets/game_details_genre_section/game_details_genre.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_back_button.dart';
import 'package:game_app/ui/pages/game_details/widgets/platform_section/game_details_platform.dart';
import 'package:game_app/ui/pages/game_details/widgets/title_section/game_details_title.dart';
import 'package:game_app/ui/pages/game_details/widgets/game_details_header_section/game_details_header.dart';

import '../../../repositories/models/result.dart';

class GameDetailsLayout extends StatefulWidget {
  final Result? data;
  const GameDetailsLayout({Key? key, required this.data}) : super(key: key);

  @override
  State<GameDetailsLayout> createState() => _GameDetailsLayoutState();
}

class _GameDetailsLayoutState extends State<GameDetailsLayout> {
  final ScrollController scrollController = ScrollController();
  late bool isColorChanged;//bool value to track back button color change when scroll to avoid unnecessary rebuilds

  @override
  void initState() {
    isColorChanged = false;
    scrollController.addListener(() => _handleScrollEvent());
    super.initState();
  }

  _handleScrollEvent() {
    if (scrollController.position.pixels > 30 && !isColorChanged) {
      isColorChanged = !isColorChanged;
      _changeColor(isColorChanged);//send true
    } else if (scrollController.position.pixels <= 30 && isColorChanged) {
      isColorChanged = !isColorChanged;
      _changeColor(isColorChanged);//send false
    }
  }

  //trigger bloc event
  _changeColor(bool value) {
    context.read<GameDetailsBackButtonBloc>().add(ChangeBackButtonColor(isColorChanged: value));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GameDetailsHeader(images: widget.data?.shortScreenshots,),
              GameDetailsTitle(data: widget.data,),
              GameDetailsPlatform(data: widget.data?.platforms,),
              GameDetailsGenre(data: widget.data?.genres),
            ],
          ),
        ),
        const GameDetailsBackButton(),
      ],
    );
  }

  @override
  void dispose() {
    scrollController.removeListener(() => _handleScrollEvent());
    scrollController.dispose();
    super.dispose();
  }
}
