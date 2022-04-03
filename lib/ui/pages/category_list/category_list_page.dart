import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_app/repositories/game_repository.dart';
import 'package:game_app/ui/pages/category_list/blocs/category_bloc/category_bloc.dart';
import 'package:game_app/ui/pages/category_list/blocs/games_by_category_bloc/games_by_category_bloc.dart';

import 'package:game_app/ui/pages/category_list/category_list_layout.dart';

class CategoryListPage extends StatelessWidget {
  static const String name = "/categoryListPage";
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CategoryBloc(
                repository: context.read<GameRepository>(),
              )..add(
                  GetCategories(),
                ),
            ),
            BlocProvider(
              create: (context) => GamesByCategoryBloc(
                repository: context.read<GameRepository>(),
              ),
            ),
          ],
          child: const CategoryListLayout(),
        ),
      ),
    );
  }
}
