import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_app/ui/pages/category_list/blocs/games_by_category_bloc/games_by_category_bloc.dart';

import 'package:game_app/ui/pages/category_list/widgets/games_by_category_section/games_by_category_success.dart';

import '../../../../../helper/enums.dart';
import '../../../../../helper/utils.dart';
import '../../../../global_widgets/error_placeholder.dart';
import '../../../../global_widgets/loading_placeholder.dart';

class GamesByCategory extends StatelessWidget {
  const GamesByCategory({Key? key}) : super(key: key);

  void _getGamesByCategory(BuildContext context, int? id, String? name) {
    context.read<GamesByCategoryBloc>().add(
        ShowReloadGamesByCategory()); //show reloading after reload button press
    //a delay to show it's working, avoiding the user confusion of pressing the reload button
    Utils.shared.executeWithDelay(
      callBack: () =>
          context.read<GamesByCategoryBloc>().add(GetGamesByCategory(
                selectedId: id,
                categoryName: name,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesByCategoryBloc, GamesByCategoryState>(
      builder: (context, state) {
        switch (state.status) {
          case LOADING_STATUS.success:
            return SizedBox(
              height: Utils.shared.percentPH(24),
              child: GamesByCategorySuccess(
                games: state.data,
                categoryName: state.categoryName,
              ),
            );
          case LOADING_STATUS.error:
            return SizedBox(
              height: Utils.shared.percentPH(24),
              child: ErrorPlaceholder(
                message: state.errorMessage,
                callBack: () => _getGamesByCategory(
                  context,
                  state.categoryId,
                  state.categoryName,
                ),
              ),
            );
          case (LOADING_STATUS.loading):
            return SizedBox(
              height: Utils.shared.percentPH(24),
              child: const LoadingPlaceholder(),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
