import 'package:flutter/material.dart';

import '../../../../../helper/utils.dart';

import 'games_by_category_item_section/games_by_category_item.dart';

import '../../../../../repositories/models/result.dart';

class GamesByCategoryGrid extends StatefulWidget {
  final List<Result>? games;
  const GamesByCategoryGrid({Key? key, this.games}) : super(key: key);

  @override
  State<GamesByCategoryGrid> createState() => _GamesByCategoryGridState();
}

class _GamesByCategoryGridState extends State<GamesByCategoryGrid> {
  final ScrollController scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant GamesByCategoryGrid oldWidget) {
    if (oldWidget.games != widget.games) {
      _setGridViewToStart();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _setGridViewToStart() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) => GamesByCategoryItem(
        key: ValueKey("${widget.games?[index].name}${index}GamesByCategory"),
        data: widget.games?[index],
      ),
      itemCount: widget.games?.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisExtent: Utils.shared.percentW(50),
      ),
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
