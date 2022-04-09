import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../helper/utils.dart';
import 'package:game_app/ui/pages/category_list/blocs/category_bloc/category_bloc.dart';
import 'package:game_app/ui/pages/category_list/blocs/games_by_category_bloc/games_by_category_bloc.dart';

import 'package:game_app/ui/pages/category_list/widgets/category_section/category_item_section/category_item_image.dart';

import '../../../../../../repositories/models/genre.dart';

class CategoryItem extends StatelessWidget {
  final Genre? category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void _selectCategory(BuildContext context) {
    context.read<CategoryBloc>().add(SelectCategory(
          selectedId: category?.id,
        ));
    context.read<GamesByCategoryBloc>().add(GetGamesByCategory(
          selectedId: category?.id,
          categoryName: category?.name,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocSelector<CategoryBloc, CategoryState, bool>(
        selector: (state) =>
            (state is CategorySelectState && state.selectedId == category?.id)
                ? true
                : false,
        builder: (context, state) => GestureDetector(
          onTap: () => (!state)
              ? _selectCategory(context)
              : () {}, //set selected item avoid trigger events
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryItemImage(state: state, image: category?.imageBackground),
              SizedBox(
                height: Utils.shared.percentPH(1),
              ),
              Text(
                category?.name ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Utils.shared.fScale(state ? 15 : 12),
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
