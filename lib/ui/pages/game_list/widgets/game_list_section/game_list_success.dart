import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/ui/pages/game_list/blocs/games_bloc/games_bloc.dart';

import 'package:game_app/ui/pages/game_list/widgets/game_list_section/game_list_item_section/game_list_item.dart';

import '../../../../../repositories/models/result.dart';
import 'game_list_paginate_Indicator.dart';

class GameListSuccess extends StatefulWidget {
  final List<Result>? games;
  final int? pageNo;
  final int? totalGames;
  final bool isPaginated;
  const GameListSuccess({
    Key? key,
    required this.games,
    required this.pageNo,
    required this.totalGames,
    required this.isPaginated,
  }) : super(key: key);

  @override
  State<GameListSuccess> createState() => _GameListSuccessState();
}

class _GameListSuccessState extends State<GameListSuccess> {
  final ScrollController scrollController = ScrollController();
  late bool isLoading;
  late bool paginateExpression;
  @override
  void initState() {
    isLoading = widget.isPaginated;
    paginateExpression = ((widget.games?.length ?? 0) <
        (widget.totalGames ?? 0)); //if values available to paginate.
    scrollController.addListener(() => _pagination());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant GameListSuccess oldWidget) {
    isLoading = widget.isPaginated;
    super.didUpdateWidget(oldWidget);
  }

  _pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        paginateExpression &&
        !isLoading) {
      isLoading = true;
      context.read<GamesBloc>().add(GetGames(
            pageNo: (widget.pageNo ?? 0) + 1,
            isPaginating: true,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop:
          false, //set to true if you want to remove default top padding of listview
      context: context,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (paginateExpression && index == widget.games?.length) {
            return const GameListProgressIndicator();
          } else {
            return GameListItem(
              key: ValueKey("${widget.games?[index].name}GameList"),
              data: widget.games?[index],
            );
          }
        },
        itemCount: (widget.games != null)
            ? ((paginateExpression)
                ? (widget.games!.length + 1)
                : (widget.games!.length))
            : null,
        controller: scrollController,
      ),
    );
  }

  @override
  void dispose() {
    scrollController.removeListener(() => _pagination());
    scrollController.dispose();
    super.dispose();
  }
}
