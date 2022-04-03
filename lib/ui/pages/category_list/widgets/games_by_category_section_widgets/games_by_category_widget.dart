import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_app/helper/extensions.dart';

import 'package:game_app/ui/pages/category_list/blocs/games_by_category_bloc/games_by_category_bloc.dart';
import 'package:game_app/ui/pages/category_list/widgets/games_by_category_section_widgets/games_by_category_success_widget.dart';

import '../../../../../helper/utils.dart';

class GamesByCategoryWidget extends StatelessWidget {
  const GamesByCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesByCategoryBloc, GamesByCategoryState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) =>
          (state.status.isSuccess)
              ? GamesByCategorySuccessWidget(
                  games: state.data,
                  categoryName: state.categoryName,
                )
              : const SizedBox(),
    );
  }
}
