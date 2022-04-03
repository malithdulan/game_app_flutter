import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/ui/pages/game_list/blocs/games_bloc/games_bloc.dart';

import 'package:game_app/ui/pages/game_list/widgets/game_list_item.dart';
import 'package:game_app/ui/pages/game_list/widgets/game_list_progress_Indicator.dart';

import '../../../../repositories/models/result.dart';

class GameListSuccessWidget extends StatefulWidget {
  final List<Result>? games;
  final int? pageNo;
  final int? totalGames;
  final bool isPaginated;
  const GameListSuccessWidget(
      {Key? key,
      required this.games,
      required this.pageNo,
      required this.totalGames,
      required this.isPaginated,})
      : super(key: key);

  @override
  State<GameListSuccessWidget> createState() => _GameListSuccessWidgetState();
}

class _GameListSuccessWidgetState extends State<GameListSuccessWidget> {
  final ScrollController scrollController = ScrollController();
  late bool isLoading;
  @override
  void initState() {
    isLoading = widget.isPaginated;
    scrollController.addListener(() => _pagination());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant GameListSuccessWidget oldWidget) {
    isLoading = widget.isPaginated;
    super.didUpdateWidget(oldWidget);
  }

  _pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        ((widget.games?.length ?? 0) < (widget.totalGames ?? 0)) && !isLoading) {
      isLoading = true;
      context.read<GamesBloc>().add(GetGames(
            pageNo: (widget.pageNo ?? 0) + 1,
            isPaginating: true,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        removeTop: false,
        context: context,
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (index == widget.games?.length) {
              return const GameListProgressIndicator();
            } else {
              return GameListItem(
                key: ValueKey("${widget.games?[index].name}GameList"),
                data: widget.games?[index],
              );
            }
          },
          itemCount: (widget.games != null) ? (widget.games!.length + 1) : null,
          controller: scrollController,
        ),
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
